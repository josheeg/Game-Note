# Game-Note-
Game Note Raspberry pi 5 16gb agent coder

items for setup ingredients 
    • Raspberry pi 5 16gb 
    • power 🔋 supply official battery setup todo
    • hdmi to 8 in touchscreen case and 🔊 speakers 🔊 todo to screen
    • 256gb sd now m.2 compact hat 256gb ssd todo for speed. ram caching maby common for 16k context todo try more...
    • ollama model --verbose compare devstral rpi models both byteshape tps...
    • usb microphone small and gaming usb mic compare wisper library
    • 8 in touchscreen case with speakers
    • m.2 compact hat ssd hat 2230 ssd
    • ssd 256gb

todo
try different context

OLLAMA_CONTEXT_LENGTH=64000 ollama serve
OLLAMA_CONTEXT_LENGTH=8000 ollama serve
OLLAMA_CONTEXT_LENGTH=16000 ollama serve
OLLAMA_CONTEXT_LENGTH=32000 ollama serve

try keepalive
OLLAMA_KEEP_ALIVE=-1 ollama serve

goose isolated environment

offical doc
https://block.github.io/goose/docs/tutorials/isolated-development-environments/
blog
https://block.github.io/goose/blog/2025/06/19/isolated-development-environments/

tool calling goose rpi loops research plan implement loop 
Research → Plan → Implement Pattern
https://block.github.io/goose/docs/tutorials/rpi
installed at 2. Add Custom Slash Commands….

goose ralph loop feedback to rpi goose ralph loops
https://block.github.io/goose/docs/tutorials/plan-feature-devcontainer-setup
https://block.github.io/goose/docs/tutorials/ralph-loop
gui

commands
ollama ps
wisper voice to text

sudo systemctl stop ollama


ufw allow 1234

OLLAMA_CONTEXT_LENGTH=64000 ollama serve
OLLAMA_CONTEXT_LENGTH=8000 ollama serve
OLLAMA_CONTEXT_LENGTH=16000 ollama serve
OLLAMA_CONTEXT_LENGTH=32000 ollama serve

OLLAMA_KEEP_ALIVE=-1 ollama serve

byteshape compressed coder models qwen3 30b coder ~10gb

byteshape relased new more compressed pi sized devstral and qwen3 30b a3b coder q3 possible..

should 10gb or bpw effect tps

https://www.reddit.com/r/LocalLLaMA/comments/1r85o89/devstral_small_2_24b_qwen3_coder_30b_coders_for/

ollama run hf.co/byteshape/Qwen3-Coder-30B-A3B-Instruct-GGUF:Qwen3-Coder-30B-A3B-Instruct-IQ4_XS-4.20bpw.gguf

Instruct-Q3_K_S-2.69bpw.gguf

ollama run hf.co/byteshape/Qwen3-Coder-30B-A3B-Instruct-GGUF:Qwen3-Coder-30B-A3B-Instruct-Q3_K_S-2.69bpw.gguf

under2.70 bpw shows as 10gb should be reasonable.

3 faster would be interesting to try..

devstral small smaller than qwen 3 30b coder.. dense model..
https://huggingface.co/byteshape/Devstral-Small-2-24B-Instruct-2512-GGUF


ollama run hf.co/byteshape/Devstral-Small-2-24B-Instruct-2512-GGUF:Devstral-Small-2-24B-Instruct-2512-IQ4_XS-4.04bpw.gguf

Devstral-Small-2-24B-Instruct-2512-IQ3_S-2.67bpw.gguf

google sugjested ollama keep alive context length 16k

OLLAMA_KEEP_ALIVE=24h OLLAMA_CONTEXT_LENGTH=16384 ollama serve

josheeg@josheeg:~ $ goose
starting session | provider: ollama model: hf.co/byteshape/Qwen3-Coder-30B-A3B-Instruct-GGUF:Qwen3-Coder-30B-A3B-Instruct-Q3_K_S-2.65bpw.gguf
    session id: 20260220_26
    working directory: /home/josheeg

goose is running! Enter your instructions, or try asking what goose can do.

Context: ○○○○○○○○○○ 0% (0/128000 tokens)
( O)> test i have some notes for some games id like demos of what libraries should we get ready can you run rpi reserch plan implement loops with ralph loops.


### Understanding the Task

Based on your request, you want to:

1. Test your notes about some games and want to demonstrate what libraries you should prepare.
2. Run a research plan related to Raspberry Pi (RPI) and implement loops using Ralph loops.

Let's break this down:

- You have **some notes** that relate to games, and wish to explore what **libraries** might be needed in a demo context.
- Then, you want to proceed to **research** a Raspberry Pi (RPI) related plan and **implement loops** using **Ralph loops**.

---

## Step 1: Test My Notes on Game Libraries (Demonstration)

Let's first inspect your current directory to understand what files you might have.

### Execution Plan
1. List files in the current directory.
2. If any file contains notes about games or related data, view its content.
3. 

 OLLAMA_KEEP_ALIVE=24h OLLAMA_CONTEXT_LENGTH=33000 ollama serve
 OLLAMA_KEEP_ALIVE=24h OLLAMA_CONTEXT_LENGTH=32000 ollama serve
 OLLAMA_KEEP_ALIVE=24h OLLAMA_CONTEXT_LENGTH=42000 ollama serve



⏱️  Elapsed time: 13m 33s
Context: ○○○○○○○○○○ 2% (2500/128000 tokens)
( O)> Press Enter to send, Ctrl-J for new line

    • OLLAMA_KEEP_ALIVE=24h OLLAMA_CONTEXT_LENGTH=33000 ollama serve
    • OLLAMA_KEEP_ALIVE=24h OLLAMA_CONTEXT_LENGTH=32000 ollama serve
    • OLLAMA_KEEP_ALIVE=24h OLLAMA_CONTEXT_LENGTH=42000 ollama serve
    • OLLAMA_KEEP_ALIVE=24h OLLAMA_CONTEXT_LENGTH=64000 ollama serve


 OLLAMA_KEEP_ALIVE=24h OLLAMA_CONTEXT_LENGTH=33000 ollama serve

    josheeg@josheeg:~ $ goose
starting session | provider: ollama model: hf.co/byteshape/Qwen3-Coder-30B-A3B-Instruct-GGUF:Qwen3-Coder-30B-A3B-Instruct-Q3_K_S-2.65bpw.gguf
    session id: 20260220_27
    working directory: /home/josheeg

goose is running! Enter your instructions, or try asking what goose can do.

Context: ○○○○○○○○○○ 0% (0/128000 tokens)
( O)> test i have some notes for some games id like demos of what libraries should we get ready can you run rpi reserch plan implement loops with ralph loops.


# Task Execution Plan

Based on your request, I'll help you develop a research plan for Raspberry Pi and implement loops with Ralph loops. I need to first get familiar with the tools available and understand what specific tasks you'd like to accomplish.

## First, let's review what tools we have available:

https://block.github.io/goose/docs/troubleshooting/diagnostics-and-reporting/#diagnostics-system


─── list_functions | code_execution ──────────────────────────

Ran into this error: Request failed: error sending request for url (http://localhost:11434/v1/chat/completions) (timeout).

Please retry if you think this is a transient or recoverable error.

⏱️  Elapsed time: 52m 43s
Context: ○○○○○○○○○○ 2% (2349/128000 tokens)

ollama run hf.co/byteshape/Qwen3-Coder-30B-A3B-Instruct-GGUF:Qwen3-Coder-30B-A3B-Instruct-IQ3_S-2.83bpw.gguf
