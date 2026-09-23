# game-note-gds

A note-driven Godot game project. The idea in `note.txt` drives the Game Dev Studio
pipeline (`gds-*` skills), which produces planning documents that guide the
evolution of the game.

uv init
uv venv
npx bmad-method install

@bmad-loop-setup skill

@bmad-project-context



python uv init creates folder file project system

handles venv

install in command line uv structure and spec kits like bmad

npx bmad-method install

uv tool install specify-cli
specify init game-note --integration copilot
cd game-note
## Quick Start

@bmad-loop-setup skill

@bmad-project-context


```bash
# Regenerate the scaffold
uv run python scaffold.py
```

Then open the Godot project in Godot 4.x and press F5 to run it.

## How It Works

1. Put your project idea in `note.txt` (e.g. `a test godot game`).
2. Run the GDS pipeline on the note contents:
   `gds-brainstorm-game → gds-create-game-brief → gds-gdd → gds-create-narrative → gds-generate-project-context → gds-game-architecture → gds-test-framework → gds-sprint-planning → gds-create-story → gds-dev-story → gds-code-review → gds-test-automate → gds-playtest-plan → gds-performance-test`
3. The game gets built from the resulting plans.

## Project Structure

```
├── games/           # Godot project(s)
├── scaffold.py      # Script that regenerates the project scaffold files
├── note.txt         # The current project idea
├── pyproject.toml   # uv project config
├── AGENTS.md        # AI agent guidelines
└── README.md
```
