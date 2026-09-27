<!-- bmad:context -->
<!-- Verified 2026-09-26 against 55d8863. Managed by bmad-project-context; edits inside this block are replaced on refresh. Keep anything you want to preserve outside the markers. -->

## breakout

A Breakout game in Godot 4.7.2 with GDScript, laid out Godot-style at the repo root. Spec Kit (`.specify/`) is the planning workflow. BMad is vendored but its module is not installed, so it is not a planning option. The binding governance document is `.specify/memory/constitution.md`; where it conflicts with this block, it wins.

## Where things are

- `README.md` is the quick-start: fresh-clone import step, controls, and the GdUnit4 invocation with its exit-code caveat. Read it before running anything.
- `TODO.md` is the current working list, in priority order, with the undesigned items marked as such. Check it before starting work; it does not replace the Spec Kit pipeline for anything that needs a spec.
- BMad's artifact paths are vestigial: `_bmad-output/planning-artifacts/` and `implementation-artifacts/` never received output, and planning belongs to Spec Kit. Do not create them by hand.
- Spec Kit commands are project-local at `.opencode/commands/speckit.*.md` (`/speckit.specify`, `/speckit.plan`, `/speckit.tasks`, `/speckit.implement`, and others), driven by `.specify/`. Read `.specify/memory/constitution.md` before planning or implementing — it is binding, not advisory.
- `_bmad/` and the per-harness skill trees (`.agents/`, `.claude/`, `.continue/`, `.goose/`, `.openhands/`, `.roo/` — 292 byte-identical files each, verified by content hash) are vendored from `bmad-code-org/BMAD-METHOD` and pinned by `skills-lock.json`. Never hand-edit one copy: the edit lands in a single tree and the other five silently diverge. The installed `skills` CLI manages user-level targets (`~/.claude/skills` and similar) and does not know these project trees exist, so it cannot re-sync them; re-vendoring is a manual step.

## Running and verifying

- Godot is vendored in the repo root; do not install it system-wide or assume `godot` is on `PATH`. Run the project with `.\Godot_v4.7.2-stable_win64.exe --path .`; use `Godot_v4.7.2-stable_win64_console.exe` for anything scripted.
- `uv run` is required for all Python, `_bmad/scripts/*.py` included — it pins Python 3.14 via `.python-version` and the project venv. Bare `python` or `pip` runs outside the project environment.
- GdUnit4 6.2.1 is vendored at `addons/gdUnit4/` and enabled in the editor. Run suites with `addons\gdUnit4\runtest.cmd --godot_binary .\Godot_v4.7.2-stable_win64_console.exe -a res://test` — it will not find the engine on its own. Exit codes, all measured on this project: **0** when no test ran at all, whether `-a` is missing or names a directory with no suites — it prints `No test cases found, abort test run!` and still succeeds; **100** on assertion failures; **105** on a script error during discovery. Exit 0 is therefore not a pass: require a `Statistics:` line reporting a non-zero test count. Reports land in `reports/`, which is gitignored.
- No linter, formatter, typechecker, or CI is configured. Game logic has automated coverage in `test/test_breakout_core.gd` (10 cases); scene wiring does not, so changes to `scenes/` or node wiring are verified by running the game, and that must be stated rather than implied.
- The vendored BMad scripts do have tests: `uv run python -m unittest discover -s _bmad/scripts/tests` — omit `-t`, the directory is not an importable package. Baseline is 65 cases across 8 modules: 63 pass, 2 error on import for reasons predating this repo (`test_memlog` wants `pytest`, `test_render_skill` wants an absent `helpers` module), and 1 is skipped — the `test_roster` case that refuses a roster linking outside the record folder, skipped because symlinks are unavailable on Windows, so that path-containment guard never runs here. All three are pre-existing and not to be chased, but a green suite does not mean that guard is covered.

## Conventions that differ from defaults

- Game code goes in the Godot layout at the repo root (`scenes/`, `scripts/`). `src/breakout/` is a `uv_build` Python package with its own `main()`; game logic does not belong there.
- `_bmad-output/`, `_bmad/`, and `.specify/` are written only by their owning workflow; never hand-create files there ahead of the skill or command that owns them.

## Known pitfalls

- The Godot project is `project.godot` at the repo root, and `scenes/main.tscn` is the main scene. Levels are JSON in `levels/`, parsed by `scripts/level_data.gd`; game rules live in `scripts/game_state.gd` and `scripts/ball_math.gd`, which are node-free and unit-tested. There are no autoloads.
- Godot's own generated `.godot/` cache is ignored, so a fresh clone must run `.\Godot_v4.7.2-stable_win64_console.exe --headless --path . --import` once before the editor or any headless run will work.
- The `tasks.md` / `state.json` single-agent workflow in the global `Desktop\AGENTS.md` does not apply here — neither file exists in this repo. Plan with Spec Kit only; authoring a plan with `bmad-prd`, `bmad-create-epics-and-stories`, `bmad-create-story`, `bmad-architecture`, `bmad-spec`, or `bmad-ux` is the two-plans case the constitution forbids.
- The vendored GdUnit4 addon ships its own agent files (`addons/gdUnit4/test/AGENTS.md`, `addons/gdUnit4/src/asserts/CLAUDE.md`) that instruct you to put tests under `addons/gdUnit4/test/` mirroring the framework's internals. Ignore them — they are GdUnit4's contributor guide. Game tests belong in `res://test`.
- `.gitignore` covers Python, Godot's generated output (`.godot/`, `export_presets.cfg`, `/android/build/`), and GdUnit4 reports (`/reports/`). The vendored Godot `.exe` files are **meant to be committed** — the repo is local-only with no remote, and the commands above depend on them being present.

<!-- /bmad:context -->
