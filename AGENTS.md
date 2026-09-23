<!-- bmad:context -->
<!-- Verified 2026-09-22 (no git history — repo not initialized). Managed by bmad-project-context; edits inside this block are replaced on refresh. Keep anything you want preserved outside the markers. -->

## game-note-py

Note-driven Python CLI: the idea in `note.txt` drives the BMad method pipeline (`@bmad-*` skills), which produces planning documents that guide the evolution of `main.py`. Python 3.12+ via uv; venv is `.venv/` (provisioned by uv with Python 3.14.3). Planning artifacts live in `_bmad-output/`, project knowledge in `docs/`.

## Policy

- Never commit without explicit user request.

## Where things are

- CLI entry point: `main.py`; scaffold generator: `scaffold.py` (regenerates project files with `uv run python scaffold.py`; keeps `note.txt` if it exists).
- Current idea: `note.txt` — when it changes, re-run the BMad pipeline and keep planning docs in sync with it.
- BMad install: `_bmad/` (installer-managed, read-only edits get overwritten); agent skills: `.agents/skills`; commands: `.opencode/commands`.

## Running and verifying

- Always use `uv run ...` — never bare `python`, `pytest`, or `ruff`; they run outside the project venv.
- Run the CLI: `uv run python main.py` (optional `--name`); tests: `uv run pytest`; lint: `uv run ruff check .`; format: `uv run ruff format .`
- The package is flat (`[tool.uv] package = false`) — there is no importable package dir; do not introduce a `src/` layout or remove that flag without a plan.

## Conventions that differ from defaults

- Type hints on every function signature; `snake_case` functions/variables/modules, `PascalCase` classes, `CONSTANTS` for module-level constants.
- Imports grouped standard library / third-party / local; follow ruff defaults (line length 88, 4-space indent).
- Catch specific exceptions — never bare `except:`; log errors rather than printing (the CLI entry point is the exception).

## Known pitfalls

- Removing `[tool.uv] package = false` breaks `uv sync` — hatchling cannot find a package dir in this script-only project.
- `npx bmad-method install` opens an interactive TUI; in a non-TTY shell pipe Enter keys and pass `--directory <path> --tools opencode --yes` to get past the prompts.

<!-- /bmad:context -->