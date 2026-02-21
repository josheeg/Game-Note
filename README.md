# Game-Note-
Game Note Raspberry pi 5 16gb agent coder

items for setup ingredients 

**Hardware:**
Raspberry Pi 5 16 gb ram Mfr. #: SC1113

Wall Mount AC Adapters Raspberry Pi 5 27W USB-C Mfr. #: SC1152

8 Inch Touchscreen for Raspberry Pi,5-Point 1280 * 800 IPS Touchscreen Portable Monitor with HDMI Interface Dual-Speaker for Raspberry Pi 5

Official Raspbery Pi M.2 HAT+ Compact, Designed for Raspbery Pi 5, HAT+ Standard, Supports NVMe Protocol M.2 Solid State Drive with 2230 Form Factor

256GB M.2 2230 SSD NVMe Gen3x4, Up to 2100MB/s，PCIe 3.0 SSD, TLC 3D NAND Flash

Super Mini USB Computer Microphone

**Software:**
ollama model --verbose compare devstral rpi models both byteshape tps…

wisper library

opencode

goose ai

byteshape coding models under 11gb around 2.70bpw q3


byteshape compressed coder models qwen3 30b coder ~10gb

byteshape relased new more compressed pi sized devstral and qwen3 30b a3b coder q3 possible..

should 10gb or bpw effect tps

https://www.reddit.com/r/LocalLLaMA/comments/1r85o89/devstral_small_2_24b_qwen3_coder_30b_coders_for/

ollama run hf.co/byteshape/Devstral-Small-2-24B-Instruct-2512-GGUF:Devstral-Small-2-24B-Instruct-2512-IQ3_S-2.67bpw.gguf
ollama run hf.co/byteshape/Qwen3-Coder-30B-A3B-Instruct-GGUF:Qwen3-Coder-30B-A3B-Instruct-IQ3_S-2.83bpw.gguf

ollama run hf.co/byteshape/Qwen3-Coder-30B-A3B-Instruct-GGUF:Qwen3-Coder-30B-A3B-Instruct-Q3_K_S-2.69bpw.gguf

under2.70 bpw shows as 10gb should be reasonable.

3 faster would be interesting to try..

devstral small smaller than qwen 3 30b coder.. dense model..
https://huggingface.co/byteshape/Devstral-Small-2-24B-Instruct-2512-GGUF


trying larger byteshape qwen if tool fail caused a stop
trying opencode as a alternative


**todo:**
try different context

 OLLAMA_KEEP_ALIVE=24h OLLAMA_CONTEXT_LENGTH=16000 ollama serve

**longer out to do:**

**goose isolated environment**
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

**commands**
ollama ps
wisper voice to text
 OLLAMA_KEEP_ALIVE=24h OLLAMA_CONTEXT_LENGTH=16000 ollama serve

OLLAMA_KEEP_ALIVE=24h OLLAMA_CONTEXT_LENGTH=16384 ollama serve


sudo systemctl stop ollama

ufw allow 1234


