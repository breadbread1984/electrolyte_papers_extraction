from absl import flags, app
import json

FLAGS = flags.FLAGS

def add_options():
  flags.DEFINE_string('input', default = None, help = 'path to jsonl file')
  flags.DEFINE_string('output', default = 'output.json', help = 'path to output file')

def main(unused_argv):
  with open(FLAGS.input, 'r') as in_:
    with open(FLAGS.output, 'w') as out:
      for line in in_.readlines():
        sample = json.loads(line)
        sample = {'tokens': sample['text'], 'ner_tags': sample['labels']}
        out.write(json.dumps(sample) + '\n')

if __name__ == "__main__":
  add_options()
  app.run(main)
