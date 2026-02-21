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

OLLAMA_KEEP_ALIVE=24h OLLAMA_CONTEXT_LENGTH=16384 ollama serve

sudo systemctl stop ollama

ufw allow 1234

# **todo:**
try different context
try larger qwen coder 10.8gb see if fails
OLLAMA_KEEP_ALIVE=24h OLLAMA_CONTEXT_LENGTH=16384 ollama serve
sudo systemctl stop ollama

trying larger byteshape qwen if tool fail caused a stop
trying opencode as a alternative

trying to take care of server client timeouts
OLLAMA_CONTEXT_LENGTH=16384 OLLAMA_LOAD_TIMEOUT=25m OLLAMA_KEEP_ALIVE=-1 OLLAMA_MAX_LOADED_MODELS=1 OLLAMA_NUM_PARALLEL=4 ollama serve

# **Output:**

josheeg@josheeg:~ $ goose
starting session | provider: ollama model: hf.co/byteshape/Qwen3-Coder-30B-A3B-Instruct-GGUF:Qwen3-Coder-30B-A3B-Instruct-IQ3_S-2.83bpw.gguf
    session id: 20260221_5
    working directory: /home/josheeg

goose is running! Enter your instructions, or try asking what goose can do.

Context: ○○○○○○○○○○ 0% (0/128000 tokens)
( O)> make a plan to make a a game what libraries are needed rpi loops ralph loops reserch plan imliment loops
I'll help you create a plan for making a game using Raspberry Pi, Ralph Loops, and Reserch Plan IMLiment Loops. Let me first explore what tools and libraries might be needed, then outline a comprehensive plan.

First, let me check what tools are available to understand our capabilities better:

─── list_functions | code_execution ──────────────────────────

# **server output**
josheeg@josheeg:~ $ OLLAMA_KEEP_ALIVE=24h OLLAMA_CONTEXT_LENGTH=16384 ollama serve

time=2026-02-21T11:56:46.038-06:00 level=INFO source=routes.go:1636 msg="server config" env="map[CUDA_VISIBLE_DEVICES: GGML_VK_VISIBLE_DEVICES: GPU_DEVICE_ORDINAL: HIP_VISIBLE_DEVICES: HSA_OVERRIDE_GFX_VERSION: HTTPS_PROXY: HTTP_PROXY: NO_PROXY: OLLAMA_CONTEXT_LENGTH:16384 OLLAMA_DEBUG:INFO OLLAMA_EDITOR: OLLAMA_FLASH_ATTENTION:false OLLAMA_GPU_OVERHEAD:0 OLLAMA_HOST:http://127.0.0.1:11434 OLLAMA_KEEP_ALIVE:24h0m0s OLLAMA_KV_CACHE_TYPE: OLLAMA_LLM_LIBRARY: OLLAMA_LOAD_TIMEOUT:5m0s OLLAMA_MAX_LOADED_MODELS:0 OLLAMA_MAX_QUEUE:512 OLLAMA_MODELS:/home/josheeg/.ollama/models OLLAMA_MULTIUSER_CACHE:false OLLAMA_NEW_ENGINE:false OLLAMA_NOHISTORY:false OLLAMA_NOPRUNE:false OLLAMA_NUM_PARALLEL:1 OLLAMA_ORIGINS:[http://localhost https://localhost http://localhost:* https://localhost:* http://127.0.0.1 https://127.0.0.1 http://127.0.0.1:* https://127.0.0.1:* http://0.0.0.0 https://0.0.0.0 http://0.0.0.0:* https://0.0.0.0:* app://* file://* tauri://* vscode-webview://* vscode-file://*] OLLAMA_REMOTES:[ollama.com] OLLAMA_SCHED_SPREAD:false OLLAMA_VULKAN:false ROCR_VISIBLE_DEVICES: http_proxy: https_proxy: no_proxy:]"
time=2026-02-21T11:56:46.048-06:00 level=INFO source=images.go:473 msg="total blobs: 36"
time=2026-02-21T11:56:46.049-06:00 level=INFO source=images.go:480 msg="total unused blobs removed: 0"
time=2026-02-21T11:56:46.051-06:00 level=INFO source=routes.go:1689 msg="Listening on 127.0.0.1:11434 (version 0.16.1)"
time=2026-02-21T11:56:46.052-06:00 level=INFO source=runner.go:67 msg="discovering available GPUs..."
time=2026-02-21T11:56:46.054-06:00 level=INFO source=server.go:431 msg="starting runner" cmd="/usr/local/bin/ollama runner --ollama-engine --port 36869"
time=2026-02-21T11:56:46.123-06:00 level=INFO source=server.go:431 msg="starting runner" cmd="/usr/local/bin/ollama runner --ollama-engine --port 38833"
time=2026-02-21T11:56:46.165-06:00 level=INFO source=types.go:60 msg="inference compute" id=cpu library=cpu compute="" name=cpu description=cpu libdirs=ollama driver="" pci_id="" type="" total="15.8 GiB" available="12.3 GiB"
time=2026-02-21T11:56:46.165-06:00 level=INFO source=routes.go:1739 msg="vram-based default context" total_vram="0 B" default_num_ctx=4096
[GIN] 2026/02/21 - 11:56:57 | 200 |      65.352µs |       127.0.0.1 | HEAD     "/"
[GIN] 2026/02/21 - 11:56:57 | 200 |    8.346654ms |       127.0.0.1 | GET      "/api/tags"
[GIN] 2026/02/21 - 12:05:32 | 200 |      41.426µs |       127.0.0.1 | HEAD     "/"
[GIN] 2026/02/21 - 12:05:32 | 200 |  351.112293ms |       127.0.0.1 | POST     "/api/show"
[GIN] 2026/02/21 - 12:05:32 | 200 |    1.917261ms |       127.0.0.1 | POST     "/api/generate"
[GIN] 2026/02/21 - 12:05:32 | 200 |   25.560014ms |       127.0.0.1 | DELETE   "/api/delete"
[GIN] 2026/02/21 - 12:05:35 | 200 |       39.13µs |       127.0.0.1 | HEAD     "/"
[GIN] 2026/02/21 - 12:05:35 | 200 |    1.727984ms |       127.0.0.1 | GET      "/api/tags"
[GIN] 2026/02/21 - 12:06:52 | 200 |      49.907µs |       127.0.0.1 | HEAD     "/"
[GIN] 2026/02/21 - 12:06:52 | 200 |    1.899095ms |       127.0.0.1 | GET      "/api/tags"
[GIN] 2026/02/21 - 12:07:21 | 200 |     1.77241ms |       127.0.0.1 | GET      "/api/tags"
time=2026-02-21T12:07:54.434-06:00 level=INFO source=server.go:247 msg="enabling flash attention"
time=2026-02-21T12:07:54.434-06:00 level=INFO source=server.go:431 msg="starting runner" cmd="/usr/local/bin/ollama runner --ollama-engine --model /home/josheeg/.ollama/models/blobs/sha256-cdc4bfc01411b4baddd243de72b7f0acc47e98bb71d468146401d7c5bf9a2acd --port 43625"
time=2026-02-21T12:07:54.435-06:00 level=INFO source=sched.go:463 msg="system memory" total="15.8 GiB" free="13.3 GiB" free_swap="65.3 GiB"
time=2026-02-21T12:07:54.435-06:00 level=INFO source=server.go:757 msg="loading model" "model layers"=49 requested=-1
time=2026-02-21T12:07:54.453-06:00 level=INFO source=runner.go:1411 msg="starting ollama engine"
time=2026-02-21T12:07:54.453-06:00 level=INFO source=runner.go:1446 msg="Server listening on 127.0.0.1:43625"
time=2026-02-21T12:07:54.457-06:00 level=INFO source=runner.go:1284 msg=load request="{Operation:fit LoraPath:[] Parallel:1 BatchSize:512 FlashAttention:Enabled KvSize:16384 KvCacheType: NumThreads:4 GPULayers:[] MultiUserCache:false ProjectorPath: MainGPU:0 UseMmap:false}"
time=2026-02-21T12:07:54.504-06:00 level=INFO source=ggml.go:136 msg="" architecture=qwen3moe file_type=unknown name=Qwen3-Coder-30B-A3B-Instruct description="" num_tensors=579 num_key_values=39
load_backend: loaded CPU backend from /usr/local/lib/ollama/libggml-cpu.so
time=2026-02-21T12:07:54.509-06:00 level=INFO source=ggml.go:104 msg=system CPU.0.NEON=1 CPU.0.ARM_FMA=1 CPU.0.LLAMAFILE=1 CPU.1.NEON=1 CPU.1.ARM_FMA=1 CPU.1.LLAMAFILE=1 compiler=cgo(clang)
time=2026-02-21T12:07:54.568-06:00 level=INFO source=runner.go:1284 msg=load request="{Operation:alloc LoraPath:[] Parallel:1 BatchSize:512 FlashAttention:Enabled KvSize:16384 KvCacheType: NumThreads:4 GPULayers:[] MultiUserCache:false ProjectorPath: MainGPU:0 UseMmap:false}"
time=2026-02-21T12:07:55.028-06:00 level=INFO source=runner.go:1284 msg=load request="{Operation:commit LoraPath:[] Parallel:1 BatchSize:512 FlashAttention:Enabled KvSize:16384 KvCacheType: NumThreads:4 GPULayers:[] MultiUserCache:false ProjectorPath: MainGPU:0 UseMmap:false}"
time=2026-02-21T12:07:55.028-06:00 level=INFO source=ggml.go:482 msg="offloading 0 repeating layers to GPU"
time=2026-02-21T12:07:55.028-06:00 level=INFO source=ggml.go:486 msg="offloading output layer to CPU"
time=2026-02-21T12:07:55.028-06:00 level=INFO source=ggml.go:494 msg="offloaded 0/49 layers to GPU"
time=2026-02-21T12:07:55.028-06:00 level=INFO source=device.go:245 msg="model weights" device=CPU size="10.1 GiB"
time=2026-02-21T12:07:55.029-06:00 level=INFO source=device.go:256 msg="kv cache" device=CPU size="1.5 GiB"
time=2026-02-21T12:07:55.029-06:00 level=INFO source=device.go:267 msg="compute graph" device=CPU size="96.0 MiB"
time=2026-02-21T12:07:55.029-06:00 level=INFO source=device.go:272 msg="total memory" size="11.7 GiB"
time=2026-02-21T12:07:55.029-06:00 level=INFO source=sched.go:537 msg="loaded runners" count=1
time=2026-02-21T12:07:55.029-06:00 level=INFO source=server.go:1350 msg="waiting for llama runner to start responding"
time=2026-02-21T12:07:55.044-06:00 level=INFO source=server.go:1384 msg="waiting for server to become available" status="llm server loading model"
time=2026-02-21T12:10:07.278-06:00 level=INFO source=server.go:1388 msg="llama runner started in 132.84 seconds"
[GIN] 2026/02/21 - 12:10:32 | 200 |         2m38s |       127.0.0.1 | POST     "/v1/chat/completions"
[GIN] 2026/02/21 - 12:11:15 | 200 |  16.29070111s |       127.0.0.1 | POST     "/v1/chat/completions"
[GIN] 2026/02/21 - 12:20:59 | 500 |         10m0s |       127.0.0.1 | POST     "/v1/chat/completions"
[GIN] 2026/02/21 - 12:22:12 | 200 |         1m11s |       127.0.0.1 | POST     "/v1/chat/completions"
[GIN] 2026/02/21 - 12:32:12 | 500 |         10m0s |       127.0.0.1 | POST     "/v1/chat/completions"
[GIN] 2026/02/21 - 12:32:48 | 200 |    1.129346ms |       127.0.0.1 | HEAD     "/"
[GIN] 2026/02/21 - 12:32:48 | 200 |    2.296858ms |       127.0.0.1 | GET      "/api/ps"
[GIN] 2026/02/21 - 12:42:13 | 500 |         9m59s |       127.0.0.1 | POST     "/v1/chat/completions"
time=2026-02-21T12:42:13.304-06:00 level=INFO source=runner.go:922 msg="aborting completion request due to client closing the connection"

# **model status**
josheeg@josheeg:~ $ ollama ps
NAME                                                                                                 ID              SIZE     PROCESSOR    CONTEXT    UNTIL             
hf.co/byteshape/Qwen3-Coder-30B-A3B-Instruct-GGUF:Qwen3-Coder-30B-A3B-Instruct-IQ3_S-2.83bpw.gguf    5130f7c6e978    12 GB    100% CPU     16384      24 hours from now    


# **issue:?**
tool call or freeze fallowing debug logs route... 
https://block.github.io/goose/docs/troubleshooting/
https://block.github.io/goose/docs/troubleshooting/diagnostics-and-reporting

# **prompt:**
make a plan to make a a game what libraries are needed 
rpi loops
ralph loops 
reserch plan imliment loops

