# Game-Note
**Game Note Raspberry pi 5 16gb agent coder**

# **items for setup ingredients**
# **Hardware:**
Raspberry Pi 5 16 gb ram Mfr. #: SC1113

Wall Mount AC Adapters Raspberry Pi 5 27W USB-C Mfr. #: SC1152

8 Inch Touchscreen for Raspberry Pi,5-Point 1280 * 800 IPS Touchscreen Portable Monitor with HDMI Interface Dual-Speaker for Raspberry Pi 5

Official Raspbery Pi M.2 HAT+ Compact, Designed for Raspbery Pi 5, HAT+ Standard, Supports NVMe Protocol M.2 Solid State Drive with 2230 Form Factor

256GB M.2 2230 SSD NVMe Gen3x4, Up to 2100MB/s，PCIe 3.0 SSD, TLC 3D NAND Flash

Mini USB Microphone Mouser #: 485-3367

# **Software:**
ollama model 

https://docs.ollama.com/quickstart

wisper library

opencode
https://opencode.ai/
https://docs.ollama.com/integrations/opencode

not tested opencode with timouts off

vs code starts ollama server is it a second? timeouts happen as ollama commands to code 

#**goose ai**
https://block.github.io/goose/docs/quickstart/

**worked with devstral 9k context.**

**byteshape coding models under 11gb around 2.70bpw q3**

devstral seem to be the ones that fit with context. 9.3gb 9k context tested

josheeg@josheeg:~ $ ollama list
NAME                                                                                                             ID              SIZE      MODIFIED     
hf.co/byteshape/Qwen3-Coder-30B-A3B-Instruct-GGUF:Qwen3-Coder-30B-A3B-Instruct-IQ3_S-2.83bpw.gguf                5130f7c6e978    10 GB     2 hours ago     
hf.co/byteshape/Devstral-Small-2-24B-Instruct-2512-GGUF:Devstral-Small-2-24B-Instruct-2512-IQ3_S-2.67bpw.gguf    87f2090ca6d6    8.8 GB    21 hours ago    

# **longer out to do:**

# **leader worker goose and settings into command temperature and max tokens goose**

https://block.github.io/goose/docs/guides/environment-variables/#leadworker-model-configuration

export GOOSE_TEMPERATURE=0.7

# Set a lower limit for shorter interactions

export GOOSE_MAX_TOKENS=4096


**custom model file custom server and config files bash script**

https://docs.ollama.com/modelfile

# 1. THE SOURCE
# Replace with the actual path to your downloaded IQ3_S / 2.67bpw GGUF file
FROM ./devstral-small-v1-iq3_s.gguf

# 2. PARAMETERS
# Devstral is tuned for low temperature to ensure code reliability
PARAMETER temperature 0.15
PARAMETER top_p 0.95
PARAMETER repeat_penalty 1.1

# Essential for long repo-scale tasks (Model supports up to 128k)
PARAMETER num_ctx 32768

# Stop tokens to prevent the model from "hallucinating" user/assistant turns
PARAMETER stop "[INST]"
PARAMETER stop "[/INST]"
PARAMETER stop "</s>"
PARAMETER stop "[SYSTEM_PROMPT]"
PARAMETER stop "[/SYSTEM_PROMPT]"

# 3. SYSTEM PROMPT
# This prompt triggers the agentic "Chain of Thought" behavior Devstral is known for
SYSTEM """
You are Devstral, an expert AI software engineer. 
Your goal is to solve complex programming tasks using a step-by-step reasoning approach.
- Always provide clean, efficient, and production-ready code.
- Before writing code, briefly analyze the requirements and propose a plan.
- You are proficient in multi-file editing and navigating large codebases.
- Maintain a professional, technical, and concise tone.
"""

# 4. TEMPLATE (Mistral V3 / Tekken Format)
TEMPLATE """{{- if .System }}[SYSTEM_PROMPT]{{ .System }}[/SYSTEM_PROMPT]{{ end }}[INST] {{ .Prompt }} [/INST]"""

ollama create devstral-iq3 -f devstral-iq3.modelfile

**goose isolated environment** docker engine needed rasbery pi arm and arm is not well supported... sd or ssd backup.... 
offical doc
https://block.github.io/goose/docs/tutorials/isolated-development-environments/
blog
https://block.github.io/goose/blog/2025/06/19/isolated-development-environments/

# **sceduled sd or ssd backup incrimently over time....**

https://vorta.borgbase.com/install/linux/

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

async function run() {
  // First, let's search for relevant extensions that might be useful for game development
  const availableExtensions = await Extensionmanager.searchAvailableExtensions({ query: "game development" });
  console.log("Available game development extensions:", JSON.stringify(availableExtensions));

  // Search for loop-related concepts and examples
  const loopExamples = await Extensionmanager.searchAvailableExtensions({ query: "loops programming" });
  console.log("Loop-related examples:", JSON.stringify(loopExamples));

  // Plan the game concept based on loops
  await Todo.todoWrite({
    title: "Game Development Plan: Focus on Loops",
    description: 
### Game Concept: Loop Master
**Core Concept:** A game where the player controls characters whose movements and abilities are controlled by different types of programming loops.

**Game Mechanics:**
1. **Character Types Based on Loops:**
   - For Loop Character: Moves in precise patterns (e.g., rectangular paths)
   - While Loop Character: Moves until a condition is met (avoid obstacles)
   - Recursion Character: Can "fork" into clone characters for multi-tasking
   - Nested Loop Character: Has special abilities that require understanding of nested loops

2. **Levels:**
   - Beginner: Basic for loops to collect items
   - Intermediate: While loops with conditional termination
   - Advanced: Recursive challenges (e.g., fractal patterns)
   - Expert: Combined loop types in real-time strategies

3. **Educational Elements:**
   - Visual representation of loop variables and counters
   - Code snippets shown as the player uses each character type
   - Challenges to optimize loops (fewest iterations, etc.)

**Technical Implementation Plan:**

1. Game Engine Selection:
   - Canvas API for 2D graphics
   - JavaScript for game logic and loops

2. Required Libraries:
   - [Howler.js](https://howler.no/) or [p5.js](https://p5js.org/) for easier development
   - No external libraries needed if using pure Canvas API

3. Core Components to Build:
   - Game loop (requestAnimationFrame)
   - Character classes with different loop behaviors
   - Level design system with loop-based objectives
   - Visual debugger for loops (shows iteration count, variables)

4. Learning Resources:
   - [MDN JavaScript Loops Guide](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Indices_and_iterators#Loops)
   - [Game Loop Article](https://www.computerandgames.com/article.html?item=123)
   - [Khan Academy: Making Moves with Arrays and Loops](https://www.khanacademy.org/computing/computer-programming/algorithms-underneath-cp/iterating-with-while-loops/a/intro-to-for-loops)

**Development Roadmap:**
1. Week 1: Set up basic game environment and prototype simple loop-based movement
2. Week 2: Implement different character types with varying loop behaviors
3. Week 3: Design levels with increasing complexity
4. Week 4: Add educational features and visual debugging tools
5. Week 5: Test, balance, and polish

**Research Tasks:**
- Study different ways to visualize loops in games
- Research game mechanics that naturally require/teach loops
- Look at existing programming education games for inspiration (e.g., Light Bot, Code.org Studio)
,
    tags: ["game development", "loops", "education", "javascript"]
  });

  // Search for visualizations of loops that could inspire game design
  const visualizationExtensions = await Extensionmanager.searchAvailableExtensions({ query: "data visualization" });
  console.log("Visualization extensions:", JSON.stringify(visualizationExtensions));

  return {
    planCompleted: true,
    researchFocus: [
      "game loop implementation",
      "loop visualization techniques",
      "interactive programming tutorials",
      "javascript game development"
    ]
  };
}

# **server output**


# **gemini server response .. or something**


# **model status**
ollama ps
NAME                                                                                                             ID              SIZE      PROCESSOR    CONTEXT    UNTIL   
hf.co/byteshape/Devstral-Small-2-24B-Instruct-2512-GGUF:Devstral-Small-2-24B-Instruct-2512-IQ3_S-2.67bpw.gguf    87f2090ca6d6    9.1 GB    100% CPU     9000       Forever    


# **Goose running free gemini tier**

# **Ask google api goose to create virtual enviroment it worked with kilo code**

# **commands**

ollama ps

wisper voice to text

ufw allow 1234

sudo systemctl stop ollama

OLLAMA_CONTEXT_LENGTH=33000 OLLAMA_LOAD_TIMEOUT=60m OLLAMA_KEEP_ALIVE=-1 OLLAMA_MAX_LOADED_MODELS=1 OLLAMA_NUM_PARALLEL=1 ollama serve

OLLAMA_TIMEOUT=10800 OPENAI_TIMEOUT=10800 goose session


# **todo:**
try different context
devstral
9k worked
10k worked

trying opencode as a alternative

openhands toad configure so no timeout...
https://huggingface.co/OpenHands/openhands-lm-7b-v0.1

vs code seems more complex
timeout was the issue

grock free tier
could these settings allow kilo code to run?

# **server start**

OLLAMA_CONTEXT_LENGTH=10000 OLLAMA_LOAD_TIMEOUT=160m OLLAMA_KEEP_ALIVE=-1 OLLAMA_MAX_LOADED_MODELS=1 OLLAMA_NUM_PARALLEL=1 ollama serve

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

OLLAMA_CONTEXT_LENGTH=12000 OLLAMA_LOAD_TIMEOUT=160m OLLAMA_KEEP_ALIVE=-1 OLLAMA_MAX_LOADED_MODELS=1 OLLAMA_NUM_PARALLEL=1 ollama serve

1400 seg falt

OLLAMA_TIMEOUT=10800 OPENAI_TIMEOUT=10800 goose web --open

/research_codebase "look through the cloned goose repo and research how ..."

/create_plan a removal of the Tool Selection Strategy feature

/implement_plan thoughts/plans/2025-12-23-remove-tool-selection-strategy.md

add tempriture max tokens

OLLAMA_TIMEOUT=10800 OPENAI_TIMEOUT=10800 goose web --open

test ai generated command

GOOSE_TEMPERATURE=0.15 GOOSE_MAX_TOKENS=9000 OLLAMA_TIMEOUT=10800 OPENAI_TIMEOUT=10800 goose web --open

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

test first ai generated
GOOSE_TEMPERATURE=0.15 GOOSE_MAX_TOKENS=9000 OLLAMA_TIMEOUT=10800 OPENAI_TIMEOUT=10800 GOOSE_CUSTOM_PROMPT="Devstral optimized: low-temperature accuracy, top_p 0.95, penalty 1.05, context 32k. Handle stop sequences [INST] and [/INST] strictly." goose web --open

GOOSE_TEMPERATURE=0.15 GOOSE_MAX_TOKENS=9000 OLLAMA_TIMEOUT=10800 OPENAI_TIMEOUT=10800 GOOSE_CUSTOM_PROMPT="SYSTEM: You are a high-energy, fun video game sidekick assistant! Use gaming lingo, be encouraging, and treat tasks like quests. Technical constraints: Devstral low-temp mode, top_p 0.95, penalty 1.05, 32k context. Respect [INST] sequences." goose web --open

# **prompt:**

/plan

Entering plan mode. make a plan to make a a game what libraries are needed  reserch plan implement loops ralph loops  reserch plan imliment loops
 /endplan

/research_codebase "look through the cloned goose repo and research the prompt and what they would need for requirements and steps"

/create_plan make a a game what libraries are needed and steps

/implement_plan from plan

# **Long Prompt Test**
to test yet
GOOSE_TEMPERATURE=0.15 GOOSE_MAX_TOKENS=9000 OLLAMA_TIMEOUT=10800 OPENAI_TIMEOUT=10800 GOOSE_CUSTOM_PROMPT="SYSTEM: You are a high-energy, fun video game sidekick assistant! Use gaming lingo, be encouraging, and treat tasks like quests. Technical constraints: Devstral low-temp mode, top_p 0.95, penalty 1.05, 32k context. Respect [INST] sequences." goose web --open

OLLAMA_CONTEXT_LENGTH=12000 OLLAMA_LOAD_TIMEOUT=160m OLLAMA_KEEP_ALIVE=-1 OLLAMA_MAX_LOADED_MODELS=1 OLLAMA_NUM_PARALLEL=1 ollama serve

testing here: 
/plan

Entering plan mode. make a plan to make a a game what libraries are needed  reserch plan implement loops ralph loops  reserch plan imliment loops
 /endplan

/research_codebase "look through the cloned goose repo and research the prompt and what they would need for requirements and steps"

/create_plan make a a game what libraries are needed and steps

/implement_plan from plan


make a plan to make a a game what libraries are needed  reserch plan implement loops ralph loops  reserch plan imliment loops

