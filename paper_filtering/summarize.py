#!/usr/bin/python3

from typing import List, Optional, Tuple
from tqdm import tqdm
from prompts import summarize_template

# tokenize string
def tokenize(tokenizer, text: str) -> List[str]:
  encoding = tokenizer(text, return_tensors = 'np')
  return encoding['input_ids'][0]

# combine short chunks to list of longer chunks, every longer chunks have no longer than max_tokens tokens
# if single short chunk is longer than max_tokens, it is dropped
def combine_chunks_with_no_minimum(
  chunks: List[str],
  max_tokens: int,
  chunk_delimiter="\n\n",
  header: Optional[str] = None,
  add_ellipsis_for_overflow=False,
  tokenizer = None
) -> Tuple[List[str], List[int]]:
  dropped_chunk_count = 0
  output = []  # list to hold the final combined chunks
  output_indices = []  # list to hold the indices of the final combined chunks
  candidate = (
    [] if header is None else [header]
  )  # list to hold the current combined chunk candidate
  candidate_indices = []
  for chunk_i, chunk in enumerate(chunks):
    chunk_with_header = [chunk] if header is None else [header, chunk]
    if len(tokenize(tokenizer, chunk_delimiter.join(chunk_with_header))) > max_tokens:
      print(f"warning: chunk overflow")
      if (
        add_ellipsis_for_overflow
        and len(tokenize(tokenizer, chunk_delimiter.join(candidate + ["..."]))) <= max_tokens
      ):
        candidate.append("...")
        dropped_chunk_count += 1
      continue  # this case would break downstream assumptions
    # estimate token count with the current chunk added
    extended_candidate_token_count = len(tokenize(tokenizer, chunk_delimiter.join(candidate + [chunk])))
    # If the token count exceeds max_tokens, add the current candidate to output and start a new candidate
    if extended_candidate_token_count > max_tokens:
      output.append(chunk_delimiter.join(candidate))
      output_indices.append(candidate_indices)
      candidate = chunk_with_header  # re-initialize candidate
      candidate_indices = [chunk_i]
    # otherwise keep extending the candidate
    else:
      candidate.append(chunk)
      candidate_indices.append(chunk_i)
  # add the remaining candidate to output if it's not empty
  if (header is not None and len(candidate) > 1) or (header is None and len(candidate) > 0):
    output.append(chunk_delimiter.join(candidate))
    output_indices.append(candidate_indices)
  return output, output_indices, dropped_chunk_count

# concatenate short chunks into longer chunks
# add delimiter after every longer chunk
def chunk_on_delimiter(input_string: str, max_tokens: int, delimiter: str, tokenizer) -> List[str]:
  chunks = input_string.split(delimiter)
  combined_chunks, _, dropped_chunk_count = combine_chunks_with_no_minimum(
    chunks, max_tokens, chunk_delimiter=delimiter, add_ellipsis_for_overflow=True, tokenizer = tokenizer
  )
  if dropped_chunk_count > 0:
    print(f"warning: {dropped_chunk_count} chunks were dropped due to overflow")
  combined_chunks = [f"{chunk}{delimiter}" for chunk in combined_chunks]
  return combined_chunks

def summarize(text: str,
              detail: float = 0,
              additional_instructions: Optional[str] = None,
              minimum_chunk_size: Optional[int] = 500,
              chunk_delimiter: str = ".",
              summarize_recursively=False,
              verbose=False,
              llm=None,
              tokenizer=None):
  """
  Summarizes a given text by splitting it into chunks, each of which is summarized individually.
  The level of detail in the summary can be adjusted, and the process can optionally be made recursive.

  Parameters:
  - text (str): The text to be summarized.
  - detail (float, optional): A value between 0 and 1 indicating the desired level of detail in the summary.
    0 leads to a higher level summary, and 1 results in a more detailed summary. Defaults to 0.
  - additional_instructions (Optional[str], optional): Additional instructions to provide to the model for customizing summaries.
  - minimum_chunk_size (Optional[int], optional): The minimum size for text chunks. Defaults to 500.
  - chunk_delimiter (str, optional): The delimiter used to split the text into chunks. Defaults to ".".
  - summarize_recursively (bool, optional): If True, summaries are generated recursively, using previous summaries for context.
  - verbose (bool, optional): If True, prints detailed information about the chunking process.

  Returns:
  - str: The final compiled summary of the text.

  The function first determines the number of chunks by interpolating between a minimum and a maximum chunk count based on the `detail` parameter.
  It then splits the text into chunks and summarizes each chunk. If `summarize_recursively` is True, each summary is based on the previous summaries,
  adding more context to the summarization process. The function returns a compiled summary of all chunks.
  """

  # check detail is set correctly
  assert 0 <= detail <= 1

  # interpolate the number of chunks based to get specified level of detail
  max_chunks = len(chunk_on_delimiter(text, minimum_chunk_size, chunk_delimiter, tokenizer = tokenizer))
  min_chunks = 1
  num_chunks = int(min_chunks + detail * (max_chunks - min_chunks))

  # adjust chunk_size based on interpolated number of chunks
  document_length = len(tokenize(tokenizer, text))
  chunk_size = max(minimum_chunk_size, document_length // num_chunks)
  text_chunks = chunk_on_delimiter(text, chunk_size, chunk_delimiter, tokenizer = tokenizer)
  if verbose:
    print(f"Splitting the text into {len(text_chunks)} chunks to be summarized.")
    print(f"Chunk lengths are {[len(tokenize(x)) for x in text_chunks]}")

  accumulated_summaries = []
  for chunk in tqdm(text_chunks):
    if summarize_recursively and accumulated_summaries:
      # Creating a structured prompt for recursive summarization
      accumulated_summaries_string = '\n\n'.join(accumulated_summaries)
      chain = summarize_template(tokenizer, additional_instructions, accumulated = True) | llm.bind(stop = ["<|eot_id|>"])
      response = chain.invoke({'accumulated_summaries_string': accumulated_summaries_string, 'chunk': chunk})
    else:
      # Directly passing the chunk for summarization without recursive context
      chain = summarize_template(tokenizer, additional_instructions, accumulated = False) | llm.bind(stop = ["<|eot_id|>"])
      response = chain.invoke({'chunk': chunk})
    if response.startswith('assistant\n\n'):
      response = response.replace('assistant\n\n','')

    # Assuming this function gets the completion and works as expected
    accumulated_summaries.append(response)

  # Compile final summary from partial summaries
  final_summary = '\n\n'.join(accumulated_summaries)

  return final_summary
