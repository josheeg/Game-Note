# Game-Note
**Game Note Raspberry pi 5 16gb agent coder**
so devices easy to get all can be asked to write forcasting programs or games scrape web datasets. 

# **Hardware:**
Raspberry Pi 5 16 gb ram Mfr. #: SC1113

Wall Mount AC Adapters Raspberry Pi 5 27W USB-C Mfr. #: SC1152

Official Raspbery Pi M.2 HAT+ Compact, Designed for Raspbery Pi 5, HAT+ Standard, Supports NVMe Protocol M.2 Solid State Drive with 2230 Form Factor

256GB M.2 2230 SSD NVMe Gen3x4, Up to 2100MB/s，PCIe 3.0 SSD, TLC 3D NAND Flash

Mini USB Microphone Mouser #: 485-3367

# **Software:**
ollama model 

https://docs.ollama.com/quickstart

#**goose ai**
https://block.github.io/goose/docs/quickstart/

**worked with devstral 9k context.**

byteshape coding models under 11gb around 2.70bpw q3**

devstral seem to be the ones that fit with context. 9.3gb 9k context tested

josheeg@josheeg:~ $ ollama list
NAME                                                                                                             ID              SIZE      MODIFIED     
hf.co/byteshape/Qwen3-Coder-30B-A3B-Instruct-GGUF:Qwen3-Coder-30B-A3B-Instruct-IQ3_S-2.83bpw.gguf                5130f7c6e978    10 GB     2 hours ago     
hf.co/byteshape/Devstral-Small-2-24B-Instruct-2512-GGUF:Devstral-Small-2-24B-Instruct-2512-IQ3_S-2.67bpw.gguf    87f2090ca6d6    8.8 GB    21 hours ago    


# The model
Replace with the actual path to your downloaded IQ3_S / 2.67bpw GGUF file
FROM ./devstral-small-v1-iq3_s.gguf

ollama run hf.co/byteshape/Devstral-Small-2-24B-Instruct-2512-GGUF:Devstral-Small-2-24B-Instruct-2512-IQ3_S-2.67bpw.gguf 

# PARAMETERS
Devstral is tuned for low temperature to ensure code reliability
PARAMETER temperature 0.15
PARAMETER top_p 0.95
PARAMETER repeat_penalty 1.1

# **leader worker goose and settings into command temperature and max tokens goose**

https://block.github.io/goose/docs/guides/environment-variables/#leadworker-model-configuration

export GOOSE_TEMPERATURE=0.7

# Essential for long repo-scale tasks (Model supports up to 128k)
PARAMETER num_ctx 32768
12k worked...

# **longer out to do:**

**custom model file custom server and config files bash script**

https://docs.ollama.com/modelfile

FROM hf.co/byteshape/Devstral-Small-2-24B-Instruct-2512-GGUF:Devstral-Small-2-24B-Instruct-2512-IQ3_S-2.67bpw.gguf

# 2. Performance & Behavior Parameters
PARAMETER temperature 0.15
PARAMETER top_p 0.95
PARAMETER repeat_penalty 1.1
PARAMETER num_ctx 8192

# 4. System Persona
SYSTEM """
You are Devstral, an expert AI software engineer. Your goal is to solve complex programming tasks using a step-by-step reasoning approach.
Always provide clean, efficient, and production-ready code.
Before writing code, briefly analyze the requirements and propose a plan.
You are proficient in multi-file editing and navigating large codebases.
Maintain a professional, technical, and concise tone.
"""

# **sceduled sd or ssd backup incrimently over time....**

Pika Backup

https://vorta.borgbase.com/install/linux/

pi imager or script backup program

# **tool calling goose rpi loops research plan implement loop**
**Research → Plan → Implement Pattern**

https://block.github.io/goose/docs/tutorials/rpi
installed at 2. Add Custom Slash Commands….

/research_codebase "look through the cloned goose repo and research how the LLM Tool Discovery is implemented"

/create_plan a removal of the Tool Selection Strategy feature

/implement_plan thoughts/plans/2025-12-23-remove-tool-selection-strategy.md

# **goose ralph loop feedback to rpi goose ralph loops**
https://block.github.io/goose/docs/tutorials/plan-feature-devcontainer-setup
https://block.github.io/goose/docs/tutorials/ralph-loop

# **Output:**

# **server output**


# **gemini server response .. or something**


# **model status**
ollama ps


# **Goose running free gemini tier**

# **Ask google api goose to create virtual enviroment it worked with kilo code**

# **commands**

ollama ps

ufw allow 1234

sudo systemctl stop ollama

OLLAMA_CONTEXT_LENGTH=33000 OLLAMA_LOAD_TIMEOUT=60m OLLAMA_KEEP_ALIVE=-1 OLLAMA_MAX_LOADED_MODELS=1 OLLAMA_NUM_PARALLEL=1 ollama serve

OLLAMA_TIMEOUT=10800 OPENAI_TIMEOUT=10800 goose session


# **todo:**
try different context
devstral
9k worked
10k worked

openhands toad configure so no timeout...
https://huggingface.co/OpenHands/openhands-lm-7b-v0.1

vs code seems more complex
timeout was the issue

# **server start**

OLLAMA_CONTEXT_LENGTH=10000 OLLAMA_LOAD_TIMEOUT=160m OLLAMA_KEEP_ALIVE=-1 OLLAMA_MAX_LOADED_MODELS=1 OLLAMA_NUM_PARALLEL=1 ollama serve

# **Ralph Loop**

https://block.github.io/goose/docs/tutorials/ralph-loop/

~/.config/goose/recipes/ralph-loop.sh "Create a simple browser using Electron and React"

You can pass a file path instead of a string. This works well for PRDs, detailed specs, or any multi-step task that benefits from iterative development:

~/.config/goose/recipes/ralph-loop.sh ./prd.md

interesting prompt 
create a game prd.md file

# **Configure models example for Ralph loop**

RALPH_WORKER_MODEL="gpt-4o" \
RALPH_WORKER_PROVIDER="openai" \
RALPH_REVIEWER_MODEL="claude-sonnet-4-20250514" \
RALPH_REVIEWER_PROVIDER="anthropic" \
~/.config/goose/recipes/ralph-loop.sh "Create a simple browser using Electron and React"

downoad and install files for these agents

# **Advanced Cognee Usage with goose**

https://block.github.io/goose/docs/tutorials/advanced-cognee-usage/

This tutorial covers advanced usage patterns for the Cognee extension with goose, including automated memory management, knowledge graph optimization, and various integration strategies.


# **client start**

OLLAMA_TIMEOUT=10800 OPENAI_TIMEOUT=10800 goose session

OLLAMA_TIMEOUT=10800 OPENAI_TIMEOUT=10800 ollama launch

OLLAMA_TIMEOUT=10800 OPENAI_TIMEOUT=10800 code

OLLAMA_TIMEOUT=10800 OPENAI_TIMEOUT=10800 openhands

OLLAMA_TIMEOUT=10800 OPENAI_TIMEOUT=10800 toad acp "openhands acp"

**has started timeout adjusted and avalible space**

qwen3 30b coder byteshape model doesnt load by ram space context smaller or devstral or qwen2.5 14b coder

openhands 7b q4 nl 32768 context length might fit... 

adjusted client side timeouts for goose kilo code kilo code expoirt inport 

https://kilo.ai/docs/getting-started/settings

trying both to vs code in ai see if a single command can setup timers and allow vs code to run... 

OLLAMA_CONTEXT_LENGTH=9000 OLLAMA_LOAD_TIMEOUT=160m OLLAMA_KEEP_ALIVE=-1 OLLAMA_MAX_LOADED_MODELS=1 OLLAMA_NUM_PARALLEL=1 OLLAMA_TIMEOUT=10800 OPENAI_TIMEOUT=10800 code


since goose yaml file edited timeout i think the module timeouts are cli adjustable nice check anyuways increase try vs code may take in any... 


**current test commands**

OLLAMA_CONTEXT_LENGTH=12000 OLLAMA_LOAD_TIMEOUT=260m OLLAMA_KEEP_ALIVE=-1 OLLAMA_MAX_LOADED_MODELS=1 OLLAMA_NUM_PARALLEL=1 ollama serve

test first ai generated
GOOSE_TEMPERATURE=0.15 GOOSE_MAX_TOKENS=9000 OLLAMA_TIMEOUT=10800 OPENAI_TIMEOUT=10800 GOOSE_CUSTOM_PROMPT="Devstral optimized: low-temperature accuracy, top_p 0.95, penalty 1.05, context 32k. Handle stop sequences [INST] and [/INST] strictly." goose web --open

GOOSE_TEMPERATURE=0.15 GOOSE_MAX_TOKENS=9000 OLLAMA_TIMEOUT=10800 OPENAI_TIMEOUT=10800 GOOSE_CUSTOM_PROMPT="SYSTEM: You are a high-energy, fun video game sidekick assistant! Use gaming lingo, be encouraging, and treat tasks like quests. Technical constraints: Devstral low-temp mode, top_p 0.95, penalty 1.05, 32k context. Respect [INST] sequences." goose web --open


1400 seg falt


**modlefile information in prompt and system from ollama**
# 2. Performance & Sampling Parameters
# Devstral is optimized for low-temperature accuracy.
PARAMETER temperature 0.15
PARAMETER top_p 0.95
PARAMETER repeat_penalty 1.05
PARAMETER num_ctx 32768

# 3. Stop Sequences (Standard for Mistral/Devstral)
PARAMETER stop "[INST]"
PARAMETER stop "[/INST]"
PARAMETER stop "</s>"


# **plan template:**

/plan

Entering plan mode. make a plan to make a a game what libraries are needed  reserch plan implement loops ralph loops  reserch plan imliment loops
 /endplan

/research_codebase "look through the cloned goose repo and research the prompt and what they would need for requirements and steps"

/create_plan make a a game what libraries are needed and steps

/implement_plan from plan

# **current test **

# **server:**

OLLAMA_CONTEXT_LENGTH=12000 OLLAMA_LOAD_TIMEOUT=260m OLLAMA_KEEP_ALIVE=-1 OLLAMA_MAX_LOADED_MODELS=1 OLLAMA_NUM_PARALLEL=1 ollama serve


# **client:**


GOOSE_TEMPERATURE=0.15 GOOSE_MAX_TOKENS=9000 OLLAMA_TIMEOUT=10800 OPENAI_TIMEOUT=10800 goose web --open


GOOSE_TEMPERATURE=0.15 GOOSE_MAX_TOKENS=9000 OLLAMA_TIMEOUT=10800 OPENAI_TIMEOUT=10800 ~/.config/goose/recipes/ralph-loop.sh "" web --open


9k context window....

rm -rf .goose/ralph

research_codebase – Document what exists today. No opinions.
create_plan - Design the change with clear phases and success criteria.
implement_plan - Execute the plan step by step with verification.
iterate_plan – (optional) Adjust the plan if necessary.

# **prompt:**

GOOSE_TEMPERATURE=0.15 GOOSE_MAX_TOKENS=12000 OLLAMA_TIMEOUT=80800 OPENAI_TIMEOUT=80800 ~/.config/goose/recipes/ralph-loop.sh "forcasting program with tensorflow keras cnn and ltsm deep neuronetworks" web --open

~/.config/goose/recipes/ralph-loop.sh ./prd.md

GOOSE_TEMPERATURE=0.15 GOOSE_MAX_TOKENS=12000 OLLAMA_TIMEOUT=80800 OPENAI_TIMEOUT=80800 ~/.config/goose/recipes/ralph-loop.sh ./prd.md web --open


hf.co/byteshape/Devstral-Small-2-24B-Instruct-2512-GGUF:Devstral-Small-2-24B-Instruct-2512-IQ3_S-2.67bpw.gguf

ollama

/create_plan forcasting program with tensorflow keras cnn and ltsm deep neuronetworks

/implement_plan forcasting program with tensorflow keras cnn and ltsm deep neuronetworks

/iterate_plan forcasting program with tensorflow keras cnn and ltsm deep neuronetworks

/plan

Entering plan mode. make a plan to make a forcasting program with tensorflow keras cnn and ltsm deep neuronetworks
 /endplan

/research_codebase "forcasting programs in python with tensorflow and keras cnn ltsm deep neuronetworks"

kilo code cli may get around the timeouts and use the prompt.. 

antigravity

TOKENS=9000 OLLAMA_TIMEOUT=10800 OPENAI_TIMEOUT=10800 antigravity 

web interface styled by css sheet into web plugin stylus css from asking gemini from the blank goose page 

voice to text web browser plugin should work with user interface. 



recipe of prompt to use and enable small note to do more with automation

title: Trip planner
description: Plan your next trip

parameters:
  - key: destination
    input_type: string
    requirement: required
    description: Destination for the trip. Should be a large region with multiple climates.
  - key: duration
    input_type: number
    requirement: required
    description: Number of days for the trip.

settings:
  goose_provider: "ollama"
  goose_model: "devstral"
  temperature: 0.8

prompt: |
 You can use the \{\{ recipe_dir \}\}/unesco.csv file to 
 check information on UNESCO world heritage sites to
 include in your travel plan.


/create_plan forcasting program with tensorflow keras cnn and ltsm deep neuronetworks

/implement_plan forcasting program with tensorflow keras cnn and ltsm deep neuronetworks

/iterate_plan forcasting program with tensorflow keras cnn and ltsm deep neuronetworks

/plan

Entering plan mode. make a plan to make a forcasting program with tensorflow keras cnn and ltsm deep neuronetworks
 /endplan

extensions:
  - type: stdio
    name: weathermcpserver
    cmd: /Users/svega/Development/weather-mcp-server/weather-mcp-server
    args: []
    timeout: 900000000
    description: "Weather data for trip planning"
    env_keys:
      - WEATHER_API_KEY

ollama and openai api timeout ...
goose run --recipe trip.yaml --params destination=Africa --params duration=14


# what test is .. --verbose ollama t/s context ssd

refining updating document checking what is the up to date parameters


GOOSE_TEMPERATURE=0.15 GOOSE_TOP_P=0.95 GOOSE_REPEAT_PENALTY=1.1 GOOSE_MAX_TOKENS=12000 OLLAMA_TIMEOUT=80800 OPENAI_TIMEOUT=80800 ~/.config/goose/recipes/ralph-loop.sh "forcasting program with tensorflow keras cnn and ltsm deep neuronetworks" web --open

# mcp freecad mcp blender
cad try again worked before with cloud try cloud freecad mcp kicad mcp with goose


GOOSE_TEMPERATURE=0.15 GOOSE_TOP_P=0.95 GOOSE_REPEAT_PENALTY=1.1 GOOSE_MAX_TOKENS=12000 OLLAMA_TIMEOUT=80800 OPENAI_TIMEOUT=80800 ~/.config/goose/recipes/ralph-loop.sh "forcasting program with tensorflow keras cnn and ltsm deep neuronetworks" web --open
