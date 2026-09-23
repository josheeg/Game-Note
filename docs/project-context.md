---
project_name: 'test-godot-game'
user_name: 'Joshe'
date: '2026-09-22'
sections_completed: ['technology_stack']
---

# Project Context for AI Agents

_This file contains critical rules and patterns that AI agents must follow when implementing game code in this project. Focus on unobvious details that agents might otherwise miss._

---

## Technology Stack & Versions

- **Game Engine**: Godot 4.x (Godot game project driven by note.txt)
- **Project Type**: Note-driven Godot game — the idea in `note.txt` drives the GDS pipeline (`gds-*` skills)
- **Build Tool**: uv (Python 3.12+), virtual environment at `.venv/`
- **Legacy CLI**: `main.py` is the original Python CLI hello-world (v0.1.0); being replaced by Godot project
- **Scaffold Generator**: `scaffold.py` regenerates project files from templates; preserves `note.txt`
- **Package Config**: Flat layout (`[tool.uv] package = false`), no src/ directory

## Critical Implementation Rules

### Godot-Specific Patterns

- **Node Lifecycle**: Prefer `_ready()` over `_process()` for initialization; use `_enter_tree()` / `_exit_tree()` for node lifecycle events
- **Signal Usage**: Connect signals in the editor or via `self.connect()`; avoid dynamic signal emission from script code unless necessary
- **Scene Instancing**: Use `preload("res://path.tscn")` for static scenes; instantiate packed scenes via `GD.instantiate()` or the scene tree
- **Autoload Patterns**: Singleton autoloads (e.g., `AudioManager`, `GameState`) registered in `project.godot` are globally accessible; use sparingly and document purpose

### Project Workflow Rules

- **note.txt Drives Pipeline**: When `note.txt` changes, re-run the GDS pipeline (`gds-brainstorm-game → gds-create-game-brief → gds-gdd → gds-create-narrative → gds-generate-project-context → gds-game-architecture → gds-test-framework → gds-sprint-planning → gds-create-story → gds-dev-story → gds-code-review → gds-test-automate → gds-playtest-plan → gds-performance-test`)
- **Keep Planning Docs in Sync**: Planning artifacts under `_bmad-output/planning-artifacts/`, implementation artifacts under `_bmad-output/implementation-artifacts/`
- **Pivot from Python CLI**: The project is transitioning from a Python CLI experiment (`main.py`, `AGENTS.md` with Python conventions) to a Godot game project; update AGENTS.md and README.md to Godot/GDS description
- **Use `uv run` for All Scripts**: Never use bare `python`, `pytest`, or `ruff` — they run outside the project venv. Always use `uv run python ...`
- **Code Conventions**: 
  - `snake_case` for functions, variables, modules
  - `PascalCase` for classes and nodes
  - Type hints on every function signature
  - Import groups: standard library / third-party / local
  - Follow ruff defaults (line length 88, 4-space indent)
  - Catch specific exceptions — never bare `except:`; log errors rather than printing
- **AGENTS.md Guidelines**: Project-specific rules (Godot-focused, GDS pipeline-aware) take precedence over default BMad conventions

### Performance & Optimization

- Object pooling for frequently created/destroyed nodes (enemies, projectiles)
- Avoid `_process(delta)` when `_physics_process(_delta)` is needed for physics interactions
- Minimize `get_node()` / `get_parent()` calls; cache node references in `_ready()`
- Use background threads for long-running operations to avoid frame drops

### Testing Rules

- Godot test framework should be initialized via `gds-test-framework` skill
- Play test plans via `gds-playtest-plan` with actual users
- Performance test via `gds-performance-test` to validate frame budgets
- Do not commit without explicit user request (per AGENTS.md policy)

### Platform Rules

- Target: Godot 4.x export templates (PC/Mac/Linux, Android, iOS as needed)
- Export presets configured in project settings
- Keep export configurations updated when adding new platforms