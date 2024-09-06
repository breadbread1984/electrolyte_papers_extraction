#!/usr/bin/python3

import time
from absl import flags, app
import gradio as gr
from agent import Agent
import config

FLAGS = flags.FLAGS

def add_options():
  flags.DEFINE_enum('model', default = 'qwen2', enum_values = {'llama3','qwen2'}, help = 'model to use')

def main(unused_argv):
  agent = Agent(model = FLAGS.model)
  def query(question, history):
    answer = agent.query(question)
    history.append((question, answer['output']))
    return "", history
  block = gr.Blocks()
  with block as demo:
    with gr.Row(equal_height = True):
      with gr.Column(scale = 15):
        gr.Markdown("<h1><center>LLM Agent</center></h1>")
    with gr.Row():
      with gr.Column(scale = 4):
        chatbot = gr.Chatbot(height = 450, show_copy_button = True)
        msg = gr.Textbox(label = '需要问什么？')
        with gr.Row():
          submit_btn = gr.Button("发送")
        with gr.Row():
          clear_btn = gr.ClearButton(components = [chatbot], value = "清空问题")
      submit_btn.click(query, inputs = [msg, chatbot], outputs = [msg, chatbot])
  gr.close_all()
  demo.launch(server_name = config.service_host, server_port = config.service_port)

if __name__ == "__main__":
  add_options()
  app.run(main)
