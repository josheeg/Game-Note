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
ollama model --verbose compare devstral rpi models both byteshape tps…
https://docs.ollama.com/quickstart

wisper library

opencode
https://opencode.ai/
https://docs.ollama.com/integrations/opencode

goose ai
https://block.github.io/goose/docs/quickstart/

**byteshape coding models under 11gb around 2.70bpw q3**

josheeg@josheeg:~ $ ollama list
NAME                                                                                                             ID              SIZE      MODIFIED     
hf.co/byteshape/Qwen3-Coder-30B-A3B-Instruct-GGUF:Qwen3-Coder-30B-A3B-Instruct-IQ3_S-2.83bpw.gguf                5130f7c6e978    10 GB     2 hours ago     
hf.co/byteshape/Devstral-Small-2-24B-Instruct-2512-GGUF:Devstral-Small-2-24B-Instruct-2512-IQ3_S-2.67bpw.gguf    87f2090ca6d6    8.8 GB    21 hours ago    
hf.co/byteshape/Qwen3-Coder-30B-A3B-Instruct-GGUF:Qwen3-Coder-30B-A3B-Instruct-Q3_K_S-2.65bpw.gguf               377a82bddab0    10 GB     40 hours ago    
hf.co/byteshape/Qwen3-Coder-30B-A3B-Instruct-GGUF:Qwen3-Coder-30B-A3B-Instruct-Q3_K_S-2.69bpw.gguf               64476b64a0fe    10 GB     2 days ago      
hf.co/byteshape/Qwen3-30B-A3B-Instruct-2507-GGUF:Qwen3-30B-A3B-Instruct-2507-Q3_K_S-2.70bpw.gguf                 642401dacdaf    10 GB     13 days ago     
hf.co/byteshape/Llama-3.1-8B-Instruct-GGUF:Llama-3.1-8B-Instruct-Q3_K_S-3.24bpw.gguf                             69f916f60f1f    3.3 GB    13 days ago     

# **longer out to do:**

**goose isolated environment** docker engine needed rasbery pi arm and arm is not well supported... sd or ssd backup.... 
offical doc
https://block.github.io/goose/docs/tutorials/isolated-development-environments/
blog
https://block.github.io/goose/blog/2025/06/19/isolated-development-environments/

# **sceduled sd or ssd backup incrimently over time....**

# **tool calling goose rpi loops research plan implement loop**
**Research → Plan → Implement Pattern**

https://block.github.io/goose/docs/tutorials/rpi
installed at 2. Add Custom Slash Commands….

# **goose ralph loop feedback to rpi goose ralph loops**
https://block.github.io/goose/docs/tutorials/plan-feature-devcontainer-setup
https://block.github.io/goose/docs/tutorials/ralph-loop

# **python ai generated arm gui when running todo**

# **commands**

ollama ps

wisper voice to text

ufw allow 1234

sudo systemctl stop ollama

OLLAMA_CONTEXT_LENGTH=16384 OLLAMA_LOAD_TIMEOUT=25m OLLAMA_KEEP_ALIVE=-1 OLLAMA_MAX_LOADED_MODELS=1 OLLAMA_NUM_PARALLEL=2 ollama serve

OLLAMA_TIMEOUT=10800 OPENAI_TIMEOUT=10800 goose session


# **todo:**
try different context
try larger qwen coder 10.8gb see if fails
trying larger byteshape qwen if tool fail caused a stop
trying opencode as a alternative

# **trying to take care of server client timeouts**
OLLAMA_CONTEXT_LENGTH=16384 OLLAMA_LOAD_TIMEOUT=25m OLLAMA_KEEP_ALIVE=-1 OLLAMA_MAX_LOADED_MODELS=1 OLLAMA_NUM_PARALLEL=2 ollama serve

OLLAMA_TIMEOUT=10800 OPENAI_TIMEOUT=10800 goose session start


# **Output:**
josheeg@josheeg:~ $ OLLAMA_TIMEOUT=10800 OPENAI_TIMEOUT=10800 goose session
starting session | provider: ollama model: hf.co/byteshape/Qwen3-Coder-30B-A3B-Instruct-GGUF:Qwen3-Coder-30B-A3B-Instruct-IQ3_S-2.83bpw.gguf
    session id: 20260221_9
    working directory: /home/josheeg

goose is running! Enter your instructions, or try asking what goose can do.

Context: ○○○○○○○○○○ 0% (0/128000 tokens)
( O)> make a plan to make a a game what libraries are needed reserch plan implement loops ralph loops reserch plan imliment loops


Ran into this error: Request failed: error sending request for url (http://localhost:11434/v1/chat/completions) (failed to connect to localhost:11434, check that the port is correct).

Please retry if you think this is a transient or recoverable error.

⏱️  Elapsed time: 12m 34s
Context: ○○○○○○○○○○ 0% (0/128000 tokens)

# **server output**
josheeg@josheeg:~ $ OLLAMA_CONTEXT_LENGTH=4096 OLLAMA_LOAD_TIMEOUT=60m OLLAMA_KEEP_ALIVE=-1 OLLAMA_MAX_LOADED_MODELS=1 OLLAMA_NUM_PARALLEL=1 ollama serve
time=2026-02-21T14:13:56.325-06:00 level=INFO source=routes.go:1636 msg="server config" env="map[CUDA_VISIBLE_DEVICES: GGML_VK_VISIBLE_DEVICES: GPU_DEVICE_ORDINAL: HIP_VISIBLE_DEVICES: HSA_OVERRIDE_GFX_VERSION: HTTPS_PROXY: HTTP_PROXY: NO_PROXY: OLLAMA_CONTEXT_LENGTH:4096 OLLAMA_DEBUG:INFO OLLAMA_EDITOR: OLLAMA_FLASH_ATTENTION:false OLLAMA_GPU_OVERHEAD:0 OLLAMA_HOST:http://127.0.0.1:11434 OLLAMA_KEEP_ALIVE:2562047h47m16.854775807s OLLAMA_KV_CACHE_TYPE: OLLAMA_LLM_LIBRARY: OLLAMA_LOAD_TIMEOUT:1h0m0s OLLAMA_MAX_LOADED_MODELS:1 OLLAMA_MAX_QUEUE:512 OLLAMA_MODELS:/home/josheeg/.ollama/models OLLAMA_MULTIUSER_CACHE:false OLLAMA_NEW_ENGINE:false OLLAMA_NOHISTORY:false OLLAMA_NOPRUNE:false OLLAMA_NUM_PARALLEL:1 OLLAMA_ORIGINS:[http://localhost https://localhost http://localhost:* https://localhost:* http://127.0.0.1 https://127.0.0.1 http://127.0.0.1:* https://127.0.0.1:* http://0.0.0.0 https://0.0.0.0 http://0.0.0.0:* https://0.0.0.0:* app://* file://* tauri://* vscode-webview://* vscode-file://*] OLLAMA_REMOTES:[ollama.com] OLLAMA_SCHED_SPREAD:false OLLAMA_VULKAN:false ROCR_VISIBLE_DEVICES: http_proxy: https_proxy: no_proxy:]"
time=2026-02-21T14:13:56.330-06:00 level=INFO source=images.go:473 msg="total blobs: 31"
time=2026-02-21T14:13:56.330-06:00 level=INFO source=images.go:480 msg="total unused blobs removed: 0"
time=2026-02-21T14:13:56.331-06:00 level=INFO source=routes.go:1689 msg="Listening on 127.0.0.1:11434 (version 0.16.1)"
time=2026-02-21T14:13:56.335-06:00 level=INFO source=runner.go:67 msg="discovering available GPUs..."
time=2026-02-21T14:13:56.336-06:00 level=INFO source=server.go:431 msg="starting runner" cmd="/usr/local/bin/ollama runner --ollama-engine --port 36447"
time=2026-02-21T14:13:56.395-06:00 level=INFO source=server.go:431 msg="starting runner" cmd="/usr/local/bin/ollama runner --ollama-engine --port 45269"
time=2026-02-21T14:13:56.433-06:00 level=INFO source=types.go:60 msg="inference compute" id=cpu library=cpu compute="" name=cpu description=cpu libdirs=ollama driver="" pci_id="" type="" total="15.8 GiB" available="13.8 GiB"
time=2026-02-21T14:13:56.433-06:00 level=INFO source=routes.go:1739 msg="vram-based default context" total_vram="0 B" default_num_ctx=4096
time=2026-02-21T14:14:45.842-06:00 level=INFO source=server.go:247 msg="enabling flash attention"
time=2026-02-21T14:14:45.842-06:00 level=INFO source=server.go:431 msg="starting runner" cmd="/usr/local/bin/ollama runner --ollama-engine --model /home/josheeg/.ollama/models/blobs/sha256-cdc4bfc01411b4baddd243de72b7f0acc47e98bb71d468146401d7c5bf9a2acd --port 44001"
time=2026-02-21T14:14:45.842-06:00 level=INFO source=sched.go:463 msg="system memory" total="15.8 GiB" free="13.7 GiB" free_swap="63.3 GiB"
time=2026-02-21T14:14:45.842-06:00 level=INFO source=server.go:757 msg="loading model" "model layers"=49 requested=-1
time=2026-02-21T14:14:45.867-06:00 level=INFO source=runner.go:1411 msg="starting ollama engine"
time=2026-02-21T14:14:45.868-06:00 level=INFO source=runner.go:1446 msg="Server listening on 127.0.0.1:44001"
time=2026-02-21T14:14:45.875-06:00 level=INFO source=runner.go:1284 msg=load request="{Operation:fit LoraPath:[] Parallel:1 BatchSize:512 FlashAttention:Enabled KvSize:4096 KvCacheType: NumThreads:4 GPULayers:[] MultiUserCache:false ProjectorPath: MainGPU:0 UseMmap:false}"
time=2026-02-21T14:14:45.919-06:00 level=INFO source=ggml.go:136 msg="" architecture=qwen3moe file_type=unknown name=Qwen3-Coder-30B-A3B-Instruct description="" num_tensors=579 num_key_values=39
load_backend: loaded CPU backend from /usr/local/lib/ollama/libggml-cpu.so
time=2026-02-21T14:14:45.924-06:00 level=INFO source=ggml.go:104 msg=system CPU.0.NEON=1 CPU.0.ARM_FMA=1 CPU.0.LLAMAFILE=1 CPU.1.NEON=1 CPU.1.ARM_FMA=1 CPU.1.LLAMAFILE=1 compiler=cgo(clang)
time=2026-02-21T14:14:45.954-06:00 level=INFO source=runner.go:1284 msg=load request="{Operation:alloc LoraPath:[] Parallel:1 BatchSize:512 FlashAttention:Enabled KvSize:4096 KvCacheType: NumThreads:4 GPULayers:[] MultiUserCache:false ProjectorPath: MainGPU:0 UseMmap:false}"
time=2026-02-21T14:14:46.128-06:00 level=INFO source=runner.go:1284 msg=load request="{Operation:commit LoraPath:[] Parallel:1 BatchSize:512 FlashAttention:Enabled KvSize:4096 KvCacheType: NumThreads:4 GPULayers:[] MultiUserCache:false ProjectorPath: MainGPU:0 UseMmap:false}"
time=2026-02-21T14:14:46.128-06:00 level=INFO source=ggml.go:482 msg="offloading 0 repeating layers to GPU"
time=2026-02-21T14:14:46.128-06:00 level=INFO source=ggml.go:486 msg="offloading output layer to CPU"
time=2026-02-21T14:14:46.128-06:00 level=INFO source=ggml.go:494 msg="offloaded 0/49 layers to GPU"
time=2026-02-21T14:14:46.128-06:00 level=INFO source=device.go:245 msg="model weights" device=CPU size="10.1 GiB"
time=2026-02-21T14:14:46.128-06:00 level=INFO source=device.go:256 msg="kv cache" device=CPU size="384.0 MiB"
time=2026-02-21T14:14:46.128-06:00 level=INFO source=device.go:267 msg="compute graph" device=CPU size="88.0 MiB"
time=2026-02-21T14:14:46.128-06:00 level=INFO source=device.go:272 msg="total memory" size="10.5 GiB"
time=2026-02-21T14:14:46.128-06:00 level=INFO source=sched.go:537 msg="loaded runners" count=1
time=2026-02-21T14:14:46.128-06:00 level=INFO source=server.go:1350 msg="waiting for llama runner to start responding"
time=2026-02-21T14:14:46.141-06:00 level=INFO source=server.go:1384 msg="waiting for server to become available" status="llm server loading model"
time=2026-02-21T14:17:01.934-06:00 level=INFO source=server.go:1388 msg="llama runner started in 136.09 seconds"
[GIN] 2026/02/21 - 14:17:22 | 200 |         2m37s |       127.0.0.1 | POST     "/v1/chat/completions"
[GIN] 2026/02/21 - 14:25:57 | 200 |    1.083243ms |       127.0.0.1 | HEAD     "/"
[GIN] 2026/02/21 - 14:25:57 | 200 |     304.464µs |       127.0.0.1 | GET      "/api/ps"
^C[GIN] 2026/02/21 - 14:27:12 | 500 |        12m27s |       127.0.0.1 | POST     "/v1/chat/completions"
josheeg@josheeg:~ $ 

# **gemini server response still timeout... or something**

It looks like you've successfully configured and run Ollama with some specific environment variables, but encountered a 500 error right at the end when you interrupted the process (likely via that ^C).Based on your logs, here is a breakdown of what happened and some insights into your current setup.Performance BreakdownModel: You are running Qwen3-Coder-30B-A3B-Instruct. This is a MoE (Mixture of Experts) model, which is efficient but still quite heavy.Hardware: The logs show offloaded 0/49 layers to GPU. Your system is running entirely on CPU (using ARM NEON/FMA instructions) with 15.8 GiB of RAM.Load Time: It took 136.09 seconds (~2.2 minutes) just to get the runner started, which is expected for a 10.1 GiB model file on a CPU-bound system.Latency: One of your chat completions took 12 minutes and 27 seconds before it was interrupted. This confirms that 30B-class models are very slow on this specific CPU/RAM configuration.Observations on your Environment VariablesYou used a "heavy duty" configuration. Here’s what those specific flags did for you:VariableEffectOLLAMA_KEEP_ALIVE=-1This is why your model stayed loaded. It prevents Ollama from ever unloading the model from memory.OLLAMA_LOAD_TIMEOUT=60mWise choice. Since your CPU takes a long time to load the 10GB into RAM, the default timeout might have killed the process prematurely.OLLAMA_NUM_PARALLEL=1Good for stability. On a CPU-only system, trying to process two prompts at once would likely crawl or crash.Recommendations for Better SpeedSince you are currently getting extremely high latency (12+ minutes for a response), you might want to consider these adjustments:Try a smaller model: If you need coding help but want faster responses on this hardware, try:ollama run qwen2.5-coder:7b or deepseek-coder-v2:16b (if the 16b fits in your 15.8GB RAM).Check Memory Pressure: You have 15.8 GiB total and the model takes 10.5 GiB. This leaves very little room for the OS and other apps. If the system starts "swapping" to disk, speed will drop to near zero.Flash Attention: Your logs show OLLAMA_FLASH_ATTENTION:false. While Flash Attention is primarily a GPU acceleration feature, ensuring your Ollama version is up to date can sometimes offer CPU optimizations as well.The 500 ErrorThe 500 error at the bottom happened because you hit Ctrl+C (^C) while a request was still processing. The server tried to return a response but the underlying runner was being killed, resulting in an "Internal Server Error" for that specific session.Would you like me to help you craft a Modelfile to customize how this Qwen model behaves, or perhaps suggest a more lightweight model for your CPU setup?

# **model status**
josheeg@josheeg:~ $ ollama ps
NAME                                                                                                 ID              SIZE     PROCESSOR    CONTEXT    UNTIL   
hf.co/byteshape/Qwen3-Coder-30B-A3B-Instruct-GGUF:Qwen3-Coder-30B-A3B-Instruct-IQ3_S-2.83bpw.gguf    5130f7c6e978    11 GB    100% CPU     4096       Forever    

# **Goose running free gemini tier**

◆  Which model provider should we use?
│   
│  ○ Amazon Bedrock 
│  ○ Amazon SageMaker TGI 
│  ○ Anthropic 
│  ○ Azure OpenAI 
◇  Which model provider should we use?
│  Google Gemini 
│
●  GOOGLE_API_KEY is already configured
│  
◇  Would you like to update this value?
│  No 
│
◇  Model fetch complete
│
◇  Select a model:
│  gemini-2.5-flash-lite 
│
◓  Checking your configuration...                                               └  Configuration saved successfully to /home/josheeg/.config/goose/config.yaml
josheeg@josheeg:~/game $ OLLAMA_TIMEOUT=10800 OPENAI_TIMEOUT=10800 goose session
starting session | provider: google model: gemini-2.5-flash-lite
    session id: 20260222_4
    working directory: /home/josheeg/game

goose is running! Enter your instructions, or try asking what goose can do.

Context: ○○○○○○○○○○ 0% (0/1048576 tokens)
( O)> make a plan to make a a game what libraries are needed reserch plan implement loops ralph loops reserch plan imliment loops


Here's a plan to create a game:

## Game Development Plan

### Phase 1: Planning and Setup

1.  **Define Game Concept:**
    *   Genre (e.g., RPG, puzzle, platformer)
    *   Core mechanics
    *   Target audience
    *   Unique selling points

2.  **Technology Stack Research:**
    *   **Game Engine:** Research popular game engines (e.g., Unity, Unreal Engine, Godot) and their pros/cons for your chosen genre. Consider factors like ease of use, community support, platform compatibility, and licensing.
    *   **Programming Language:** Determine the primary programming language based on the game engine (e.g., C# for Unity, C++ for Unreal Engine, GDScript/C# for Godot).
    *   **Libraries/Frameworks:**
        *   **Graphics:** (Often handled by the engine, but consider if specific rendering libraries are needed for advanced effects.)
        *   **Physics:** (Usually integrated into game engines.)
        *   **Audio:** (Engines have built-in audio systems, but explore dedicated libraries if needed.)
        *   **Networking:** (If multiplayer is a feature, research networking libraries or engine-specific solutions.)
        *   **UI/UX:** (Engine's UI system or dedicated libraries for complex interfaces.)
        *   **Asset Management:** Tools for organizing and importing game assets (models, textures, sounds).

3.  **Development Environment Setup:**
    *   Install chosen game engine.
    *   Set up IDE (e.g., Visual Studio, VS Code) with necessary plugins.
    *   Set up version control (e.g., Git).

### Phase 2: Core Loop Implementation

1.  **Basic Project Structure:**
    *   Create a new project in the game engine.
    *   Establish a basic folder structure for scripts, assets, scenes, etc.

2.  **Implement Player Controller:**
    *   Create a player character object.
    *   Implement movement (keyboard/gamepad input).
    *   Implement basic actions (e.g., jumping, shooting, interacting).

3.  **Implement Game World/Level:**
    *   Design and build a simple level or game environment.
    *   Place player start position and any essential game objects.

4.  **Implement Core Game Mechanics:**
    *   **Ralph Loops:** (This is a bit vague, so I'll interpret it as needing to implement recurring game events or cycles. If "Ralph Loops" refers to a specific concept or library, please clarify.)
        *   Implement timers for recurring events (e.g., enemy spawns, resource regeneration).
        *   Create a system for managing game states (e.g., start, play, pause, game over).
    *   **Combat/Interaction System:** If applicable, implement how the player interacts with enemies or objects.
    *   **Inventory/Resource System:** If applicable, implement systems for managing player inventory or resources.

### Phase 3: Content Creation and Iteration

1.  **Asset Integration:**
    *   Create or acquire game assets (models, textures, sprites, sound effects, music).
    *   Import assets into the game engine and set them up.

2.  **Enemy/NPC AI:**
    *   Develop AI for enemies or non-player characters.
    *   Implement pathfinding, behavior trees, or state machines.

3.  **UI/HUD Development:**
    *   Create Heads-Up Display (HUD) elements (health bars, score, minimap).
    *   Implement menus (main menu, pause menu, options).

4.  **Level Design Expansion:**
    *   Build more complex and engaging levels.
    *   Incorporate puzzles, challenges, and narrative elements.

### Phase 4: Polishing and Deployment

1.  **Sound and Music Integration:**
    *   Add sound effects to actions and events.
    *   Implement background music and adaptive audio.

2.  **Optimization:**
    *   Profile game performance and identify bottlenecks.
    *   Optimize code, assets, and rendering.

3.  **Bug Fixing:**
    *   Thoroughly test all aspects of the game.
    *   Fix any identified bugs and issues.

4.  **Platform-Specific Builds:**
    *   Compile and build the game for target platforms (PC, mobile, console).

5.  **Deployment:**
    *   Distribute the game through chosen platforms (e.g., Steam, Itch.io, app stores).

## Research Plan for Libraries and Loops

### Libraries Research:

*   **Goal:** Identify essential libraries for game development based on the chosen engine and game type.
*   **Method:**
    1.  **Start with Game Engine Documentation:** Most engines have extensive documentation on their built-in features and recommended third-party integrations.
    2.  **Community Forums and Wikis:** Search forums (e.g., Unity Answers, Unreal Engine Forums, Godot Community) and wikis for discussions on "best libraries for X" (e.g., "best C# libraries for game dev," "best Python libraries for game dev").
    3.  **GitHub and Other Code Repositories:** Search for popular game development libraries on platforms like GitHub. Look for well-maintained projects with good documentation and community support.
    4.  **Tutorials and Blog Posts:** Many game development tutorials will mention specific libraries or tools they use.
*   **Specific Areas to Research:**
    *   **Input Handling:** Libraries for managing complex input schemes beyond basic keyboard/mouse.
    *   **Networking:** For multiplayer games, research libraries like Mirror (Unity), Photon, or custom solutions.
    *   **Serialization:** For saving/loading game state.
    *   **AI Pathfinding:** If the engine's built-in solution isn't sufficient.
    *   **Shaders/Rendering:** For advanced visual effects.

### "Ralph Loops" Research (Assuming "Loops" means Game Loops/Cycles):

*   **Goal:** Understand and implement the core game loop and any other recurring game cycles.
*   **Method:**
    1.  **Core Game Loop:**
        *   **Concept:** Research the fundamental game loop: Input -> Update -> Render. Understand how these stages cycle continuously.
        *   **Engine Implementation:** Learn how the chosen game engine manages this loop (e.g., `Update()` in Unity, `_process()` and `_physics_process()` in Godot).
    2.  **Specific Game Loops/Cycles:**
        *   **Define "Ralph Loops":** If "Ralph Loops" refers to specific recurring events, define what these are. Examples:
            *   **Event Loops:** Timed events, daily quests, special in-game occurrences.
            *   **AI Behavior Loops:** Enemy decision-making cycles.
            *   **Resource Management Loops:** Player gathering and spending resources over time.
            *   **Progression Loops:** Player actions leading to leveling up, unlocking content, etc.
        *   **Implementation:**
            *   **Timers/Coroutines:** Use engine-specific timer systems or coroutines to schedule events.
            *   **State Machines:** Implement state machines for AI or game states to manage different loop behaviors.
            *   **Event Systems:** Use event-driven programming to decouple loop components.
            *   **Databases/Configuration Files:** For managing complex loop parameters that might change.

This plan provides a structured approach to game development, starting from initial concepts and moving through implementation and polishing. The research phase is crucial for selecting the right tools and understanding fundamental game development concepts like game loops. Please provide more details on "Ralph Loops" if it refers to a specific concept or library.

⏱️  Elapsed time: 9.36s
Context: ○○○○○○○○○○ 0% (4067/1048576 tokens)
( O)> Press Ctrl+C again to exit, or type new instructions to continue

# **Ask google api goose to create virtual enviroment it worked with kilo code**

( O)> create a virtual enviroment 

─── 1 tool call | execute ──────────────────────────
  1. Developer.shell: Execute a shell command

Segmentation fault
josheeg@josheeg:~/game $ 


# **issue:?**
tool call or freeze fallowing debug logs route... 
https://block.github.io/goose/docs/troubleshooting/
https://block.github.io/goose/docs/troubleshooting/diagnostics-and-reporting

OLLAMA_CONTEXT_LENGTH=16384 OLLAMA_LOAD_TIMEOUT=25m OLLAMA_KEEP_ALIVE=-1 OLLAMA_MAX_LOADED_MODELS=1 OLLAMA_NUM_PARALLEL=2 ollama serve

OLLAMA_CONTEXT_LENGTH=4096 OLLAMA_LOAD_TIMEOUT=60m OLLAMA_KEEP_ALIVE=-1 OLLAMA_MAX_LOADED_MODELS=1 OLLAMA_NUM_PARALLEL=1 ollama serve

OLLAMA_CONTEXT_LENGTH=8192 OLLAMA_LOAD_TIMEOUT=60m OLLAMA_KEEP_ALIVE=-1 OLLAMA_MAX_LOADED_MODELS=1 OLLAMA_NUM_PARALLEL=1 ollama serve


OLLAMA_TIMEOUT=10800 OPENAI_TIMEOUT=10800 goose session


# **prompt:**
make a plan to make a a game what libraries are needed 
reserch plan implement loops
ralph loops 
reserch plan imliment loops

