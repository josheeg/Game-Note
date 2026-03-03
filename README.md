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

# **template folder enviroment for pi 5 16gb hello world template git init..**

main.py // hello mention ras pi 5 16gb system info avalible libraries test framework for libraries. 
requirements.txt // data science ml libraries web scraping rasbery pi io rasbery pi games rasbery pi cpu and rasbery pi gpu forcasting keras tuning
prd.md
plan.md

folders

venv empty but if i rpi and setup a template this will probably have things

.vscode hiden folder with files in it 

/-game

├── .checkpoints/          <-- AI Agent save points

├── .ipynb_checkpoints/    <-- Jupyter auto-saves

./git




requirements.txt
prd.md
plan.md
rpi loops
test rp ralph loop x 2 ...


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

# ollama create devstral -f Modelfile
ollama create choose-a-model-name -f < ./Modelfile>
ollama create devstral -f ./Modelfile

# *ModelFile*

FROM hf.co/byteshape/Devstral-Small-2-24B-Instruct-2512-GGUF:Devstral-Small-2-24B-Instruct-2512-IQ3_S-2.67bpw.gguf

# 2. Performance & Behavior Parameters
PARAMETER temperature 0.15
PARAMETER top_p 0.95
PARAMETER repeat_penalty 1.1
PARAMETER num_ctx 12288 



# 4. System Persona
SYSTEM """
You are Devstral, an expert AI software engineer. Your goal is to solve complex programming tasks using a step-by-step reasoning approach.
Always provide clean, efficient, and production-ready code.
Before writing code, briefly analyze the requirements and propose a plan.
You are proficient in multi-file editing and navigating large codebases.
Maintain a professional, technical, and concise tone.
"""


# *Ollama Serve*

OLLAMA_CONTEXT_LENGTH=12288 OLLAMA_LOAD_TIMEOUT=9999999 OLLAMA_KEEP_ALIVE=9999999 OLLAMA_MAX_LOADED_MODELS=1 OLLAMA_NUM_PARALLEL=1 ollama serve



# **client start**
no luck with vs code opencode 

OLLAMA_TIMEOUT=9999999 OPENAI_TIMEOUT=9999999 g

oose session

OLLAMA_TIMEOUT=9999999 OPENAI_TIMEOUT=9999999 ollama launch

OLLAMA_TIMEOUT=9999999 OPENAI_TIMEOUT=9999999 openhands

OLLAMA_TIMEOUT=9999999 OPENAI_TIMEOUT=9999999 toad acp "openhands acp"



GOOSE_TEMPERATURE=0.15 GOOSE_MAX_TOKENS=12288 OLLAMA_TIMEOUT=9999999 OPENAI_TIMEOUT=9999999 ~/.config/goose/recipes/ralph-loop.sh "a rpg town game python for rasbery pi create with a prd.md" web --open




GOOSE_TEMPERATURE=0.15 GOOSE_MAX_TOKENS=12288 OLLAMA_TIMEOUT=9999999 OPENAI_TIMEOUT=9999999 ~/.config/goose/recipes/ralph-loop.sh "" web --open


GOOSE_TEMPERATURE=0.15 GOOSE_MAX_TOKENS=12288 OLLAMA_TIMEOUT=9999999 OPENAI_TIMEOUT=9999999 ~/.config/goose/recipes/ralph-loop.sh "" web --open

GOOSE_MAX_BACKGROUND_TASKS=1 GOOSE_TEMPERATURE=0.15 GOOSE_MAX_TOKENS=12288 OLLAMA_TIMEOUT=9999999 OPENAI_TIMEOUT=9999999 goose web --open

# **sceduled sd or ssd backup incrimently over time....**

Pika Backup

https://vorta.borgbase.com/install/linux/

pi imager or script backup program

# **tested rpi ai loops**
# **tool calling goose rpi loops research plan implement loop**
**Research → Plan → Implement Pattern**

https://block.github.io/goose/docs/tutorials/rpi
installed at 2. Add Custom Slash Commands….

research_codebase – Document what exists today. No opinions.
create_plan - Design the change with clear phases and success criteria.
implement_plan - Execute the plan step by step with verification.
iterate_plan – (optional) Adjust the plan if necessary.
┌─────────────────────────────────────────────────────────────────────────────-┐
│                           RPI WORKFLOW                                       │
├─────────────────────────────────────────────────────────────────────────────-┤
│                                                                              │
│  /research_codebase "topic"                                                  │
│       │                                                                      │
│       ├──► Spawns parallel sub-agents:                                       │
│       │    • find_files (rpi-codebase-locator)                               │
│       │    • analyze_code (rpi-codebase-analyzer)                            │
│       │    • find_patterns (rpi-pattern-finder)                              │
│       │                                                                      │
│       └──► Output: thoughts/research/YYYY-MM-DD-HHmm-topic.md                │
│                                                                              │
│  /create_plan "feature/task"                                                 │
│       │                                                                      │
│       ├──► Reads research docs                                               │
│       ├──► Asks clarifying questions                                         │
│       ├──► Proposes design options                                           │
│       │                                                                      │
│       └──► Output: thoughts/plans/YYYY-MM-DD-HHmm-description.md             │
│                                                                              │
│  /implement_plan "plan path"                                                 │
│       │                                                                      │
│       ├──► Executes phase by phase                                           │
│       ├──► Runs verification after each phase                                │
│       ├──► Updates checkboxes in plan                                        │
│       │                                                                      │
│       └──► Working code                                                      │
│                                                                              │
│  /iterate_plan "plan path" + feedback                                        │
│       │                                                                      │
│       ├──► Researches only what changed                                      │
│       ├──► Updates the plan surgically                                       │
│       │                                                                      │
│       └──► Updated plan                                                      │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────-┘

All RPI outputs live in a predictable place:

thoughts/
├── research/
│   └── YYYY-MM-DD-HHmm-topic.md
└── plans/
    └── YYYY-MM-DD-HHmm-description.md

/research_codebase "look through the cloned goose repo and research how the LLM Tool Discovery is implemented"

/create_plan a removal of the Tool Selection Strategy feature

/implement_plan thoughts/plans/2025-12-23-remove-tool-selection-strategy.md

research_codebase thoughts topic.md
create_plan thoughts topic.md prd.md plan.md thoughts
implement_plan plan.md description.md
iterate_plan plan.md description.md

# **leader worker goose and settings into command temperature and max tokens goose**

https://block.github.io/goose/docs/guides/environment-variables/#leadworker-model-configuration

export GOOSE_TEMPERATURE=0.7

# **goose ralph loop feedback to rpi goose ralph loops**
https://block.github.io/goose/docs/tutorials/plan-feature-devcontainer-setup
https://block.github.io/goose/docs/tutorials/ralph-loop

# **Ralph Loop**

https://block.github.io/goose/docs/tutorials/ralph-loop/

~/.config/goose/recipes/ralph-loop.sh "Create a simple browser using Electron and React"

You can pass a file path instead of a string. This works well for PRDs, detailed specs, or any multi-step task that benefits from iterative development:

~/.config/goose/recipes/ralph-loop.sh ./prd.md

ralph loop requirements prd.md thoughts plan.md requirements.txt main.py

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



rm -rf .goose/ralph

research_codebase – Document what exists today. No opinions.
create_plan - Design the change with clear phases and success criteria.
implement_plan - Execute the plan step by step with verification.
iterate_plan – (optional) Adjust the plan if necessary.


# **commands**

ollama ps

ufw allow 1234

sudo systemctl stop ollama

OLLAMA_TIMEOUT=10800 OPENAI_TIMEOUT=10800 goose session




openhands toad configure so no timeout...
https://huggingface.co/OpenHands/openhands-lm-7b-v0.1






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


# **prompt:**

GOOSE_TEMPERATURE=0.15 GOOSE_MAX_TOKENS=12000 OLLAMA_TIMEOUT=80800 OPENAI_TIMEOUT=80800 ~/.config/goose/recipes/ralph-loop.sh "forcasting program with tensorflow keras cnn and ltsm deep neuronetworks" web --open

~/.config/goose/recipes/ralph-loop.sh ./prd.md

GOOSE_TEMPERATURE=0.15 GOOSE_MAX_TOKENS=12000 OLLAMA_TIMEOUT=80800 OPENAI_TIMEOUT=80800 ~/.config/goose/recipes/ralph-loop.sh ./prd.md web --open


hf.co/byteshape/Devstral-Small-2-24B-Instruct-2512-GGUF:Devstral-Small-2-24B-Instruct-2512-IQ3_S-2.67bpw.gguf

ollama

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

created model file timeout didnt work the line in model file

GOOSE_TEMPERATURE=0.15 GOOSE_TOP_P=0.95 GOOSE_REPEAT_PENALTY=1.1 GOOSE_MAX_TOKENS=12000 OLLAMA_TIMEOUT=-1 OPENAI_TIMEOUT=-1 ~/.config/goose/recipes/ralph-loop.sh "forcasting program with tensorflow keras cnn and ltsm deep neuronetworks" web --open

GOOSE_TEMPERATURE=0.15 GOOSE_TOP_P=0.95 GOOSE_REPEAT_PENALTY=1.1 GOOSE_MAX_TOKENS=12000 OLLAMA_TIMEOUT=80800 OPENAI_TIMEOUT=80800 ~/.config/goose/recipes/ralph-loop.sh "forcasting program with tensorflow keras cnn and ltsm deep neuronetworks" web --open

OLLAMA_CONTEXT_LENGTH=8000 OLLAMA_LOAD_TIMEOUT=-1 OLLAMA_KEEP_ALIVE=-1 OLLAMA_MAX_LOADED_MODELS=1 OLLAMA_NUM_PARALLEL=1 ollama serve


# mcp freecad mcp blender
cad try again worked before with cloud try cloud freecad mcp kicad mcp with goose

# plan.md plans are a file files can be passed like text


thoughts/
├── research/
│   └── YYYY-MM-DD-HHmm-topic.md
└── plans/
    └── YYYY-MM-DD-HHmm-description.md

/research_codebase "create rpg town game for the rasbery pi 5 16gb create a folder and prepare thoughts.txt"
research.txt
topic.md



/research_codebase "create python rpg town game for the rasbery pi 5 16gb create a folder and prepare thoughts.txt research.txt topic.md prd.md main.py requirements.txt plan.md description.md"

~/.config/goose/recipes/ralph-loop.sh ./thoughts.txt ./research.txt ./topic.md ./prd.md ./main.py requirements.txt plan.md description.md

/create_plan "create python rpg town game for the rasbery pi 5 16gb create a folder and preparethoughts.txt" research.txt topic.md prd.md main.py requirements.txt plan.md description.md

~/.config/goose/recipes/ralph-loop.sh ./thoughts.txt ./research.txt ./topic.md ./prd.md ./main.py requirements.txt plan.md description.md

/implement_plan thoughts.txt research.txt topic.md prd.md main.py requirements.txt plan.md description.md

~/.config/goose/recipes/ralph-loop.sh ./thoughts.txt ./research.txt ./topic.md ./prd.md ./main.py requirements.txt plan.md description.md



note

 game rpg town 

goose hints

for the rasbery pi 5 16 gb ram

plan  note... goose hints  make a prd.md 

ralph on prd.md

or rpi p i

plan a requirements.txt

ralph plan.md prd.md

rpi pi plan md prd md

plan main.py add requirements.txt prd.md

ralph plan.md prd.md

rpi or ralph

/impliment test run

reserch codebase plan make a plan.md to fallow implement loop

plan from prd.md other files make a plan.md  

iterattive test

# **edited goose config timeouts edited goose extension timeout**

prompt

/research_codebase "look through the cloned rpg game town repo and research how the rpg game town is implemented and could be done as a text game with askee art text art."

output

I'll now execute the mandatory workflow to research how the RPG game town is implemented and could be done as a text game with ASCII art.

## Step 1: Read Mentioned Files First
No specific files mentioned yet - proceeding to decomposition.

## Step 2: Decompose the Research Question
The research has two main aspects:
1. **How the RPG game town is currently implemented** (existing code structure)
2. **Potential for text-based implementation with ASCII art** (design patterns and examples)

## Step 3: Spawn Parallel Subrecipes

I'll spawn three parallel research tasks:

1. **find_files**: "RPG game town" - to locate the main town implementation files
2. **analyze_code**: "town map or layout structure" - to understand how the town is organized
3. **find_patterns**: "ASCII art or text-based graphics" - to find existing text art patterns

await subagent({
  "subrecipe": "find_files",
  "parameters": {"search_query": "RPG game town"},
  "summary": false
})

await subagent({
  "subrecipe": "analyze_code",
  "parameters": {"files_to_analyze": ["town", "map"]},
  "summary": false
})

await subagent({
  "subrecipe": "find_patterns",
  "parameters": {"pattern_query": "ASCII art"},
  "summary": false
})



## Step 4: Wait for All Results

I'll wait for the three subagents to complete their research before proceeding.

## Step 5: Gather Git Metadata

async function run() {
    const date = await Developer.shell({ command: "date -Iseconds" });
    const commit = await Developer.shell({ command: "git rev-parse HEAD" });
    const branch = await Developer.shell({ command: "git branch --show-current" });
    const repo = await Developer.shell({ command: "basename $(git rev-parse --show-toplevel)" });
    return { date, commit, branch, repo };
}



## Step 6: Write Research Document

I'll create the research document after gathering all findings.

## Step 7: Present Summary

I'll provide a concise summary of the key findings with file references.

Please wait while I gather all the research data...

prompt2

/create_plan a plan to create python rpg town game for the rasbery pi 5 16gb create a folder and prepare thoughts.txt research.txt topic.md prd.md main.py requirements.txt plan.md description.md

🔧 code_execution__execute

{
  "code": "```typescript\nasync function run() {\n    const files = await Developer.shell({ command: \"find . -type f -name '*.txt' -o -name '*.md' | head -20\" });\n    console.log(\"Existing files:\", files);\n\n    // Check for any existing plan or description files\n    const existingPlans = await Developer.shell({ command: \"ls -la | grep -E '\\\\.(plan|description|requirements|readme)\\.md'\" });\n    console.log(\"Potential plan files:\", existingPlans);\n}\n```",
  "tool_graph": [
    {
      "depends_on": [],
      "description": "Find existing documentation files",
      "tool": "Developer.shell"
    },
    {
      "depends_on": [],
      "description": "Check for plan-related files",
      "tool": "Developer.shell"
    }
  ]
}

⏳ Running...

seg fault.

/create_plan a plan to create python rpg town game for the rasbery pi 5 16gb create a folder and prepare prd.md main.py requirements.txt
