# Game-Note-
Game Note Raspberry pi 5 16gb agent coder

items for setup ingredients 

**Hardware:**
Raspberry Pi 5 16 gb ram Mfr. #: SC1113

Wall Mount AC Adapters Raspberry Pi 5 27W USB-C Mfr. #: SC1152

8 Inch Touchscreen for Raspberry Pi,5-Point 1280 * 800 IPS Touchscreen Portable Monitor with HDMI Interface Dual-Speaker for Raspberry Pi 5

Official Raspbery Pi M.2 HAT+ Compact, Designed for Raspbery Pi 5, HAT+ Standard, Supports NVMe Protocol M.2 Solid State Drive with 2230 Form Factor

256GB M.2 2230 SSD NVMe Gen3x4, Up to 2100MB/s，PCIe 3.0 SSD, TLC 3D NAND Flash

Mini USB Microphone Mouser #: 485-3367

**Software:**
ollama model --verbose compare devstral rpi models both byteshape tps…

wisper library

opencode

goose ai

**byteshape coding models under 11gb around 2.70bpw q3**

josheeg@josheeg:~ $ ollama list
NAME                                                                                                             ID              SIZE      MODIFIED     
hf.co/byteshape/Qwen3-Coder-30B-A3B-Instruct-GGUF:Qwen3-Coder-30B-A3B-Instruct-IQ3_S-2.83bpw.gguf                5130f7c6e978    10 GB     2 hours ago     
hf.co/byteshape/Devstral-Small-2-24B-Instruct-2512-GGUF:Devstral-Small-2-24B-Instruct-2512-IQ3_S-2.67bpw.gguf    87f2090ca6d6    8.8 GB    21 hours ago    
hf.co/byteshape/Qwen3-Coder-30B-A3B-Instruct-GGUF:Qwen3-Coder-30B-A3B-Instruct-Q3_K_S-2.65bpw.gguf               377a82bddab0    10 GB     40 hours ago    
hf.co/byteshape/Qwen3-Coder-30B-A3B-Instruct-GGUF:Qwen3-Coder-30B-A3B-Instruct-Q3_K_S-2.69bpw.gguf               64476b64a0fe    10 GB     2 days ago      
hf.co/byteshape/Qwen3-30B-A3B-Instruct-2507-GGUF:Qwen3-30B-A3B-Instruct-2507-Q3_K_S-2.70bpw.gguf                 642401dacdaf    10 GB     13 days ago     
hf.co/byteshape/Llama-3.1-8B-Instruct-GGUF:Llama-3.1-8B-Instruct-Q3_K_S-3.24bpw.gguf                             69f916f60f1f    3.3 GB    13 days ago     

**longer out to do:**

**goose isolated environment** docker engine needed rasbery pi arm and arm is not well supported... sd or ssd backup.... 
offical doc
https://block.github.io/goose/docs/tutorials/isolated-development-environments/
blog
https://block.github.io/goose/blog/2025/06/19/isolated-development-environments/

**sceduled sd or ssd backup incrimently over time....**

**tool calling goose rpi loops research plan implement loop**
**Research → Plan → Implement Pattern**

https://block.github.io/goose/docs/tutorials/rpi
installed at 2. Add Custom Slash Commands….

**goose ralph loop feedback to rpi goose ralph loops**
https://block.github.io/goose/docs/tutorials/plan-feature-devcontainer-setup
https://block.github.io/goose/docs/tutorials/ralph-loop
gui

**commands**

ollama ps

wisper voice to text

OLLAMA_KEEP_ALIVE=24h OLLAMA_CONTEXT_LENGTH=16384 ollama serve

sudo systemctl stop ollama

ufw allow 1234

**todo:**
try different context
try larger qwen coder 10.8gb see if fails
OLLAMA_KEEP_ALIVE=24h OLLAMA_CONTEXT_LENGTH=16384 ollama serve
sudo systemctl stop ollama

trying larger byteshape qwen if tool fail caused a stop
trying opencode as a alternative

**Output:**

**issue:?**
tool call or freeze fallowing debug logs route... 
https://block.github.io/goose/docs/troubleshooting/
https://block.github.io/goose/docs/troubleshooting/diagnostics-and-reporting

**prompt:**
make a plan to make a a game what libraries are needed 
rpi loops
ralph loops 
reserch plan imliment loops

