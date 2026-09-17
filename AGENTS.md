# Agent System Instructions & Skill Routing Rules

## Project Context
This repository follows the BMAD (Brainstorming, Mindset, Architecture, Development) workflow framework.

## Routing Rules & Handoffs
1. **Brainstorming Phase**: Read `note.txt`. Output synthesis to `docs/scratchpad.md`, `docs/PRD.md`, `docs/DESIGN.md`, and `docs/ARCHITECTURE.md`. Note specific requirements (e.g., dual hello world handlers and minimum 30% test coverage).
2. **Planning Phase**: Read `docs/ARCHITECTURE.md` and `docs/PRD.md`. Populate `docs/epics/` and initialize `docs/sprint-status.yaml`.
3. **Solutioning Phase**: Convert planned epics into target technical specs under `docs/specs/`. Verify consistency with architecture.
4. **Build Phase**: Consume `docs/specs/` and implement code in `src/` and unit/integration tests in `tests/`.

## Execution Constraints
- Always verify execution inside `.venv`.
- Keep `docs/scratchpad.md` updated during active handoffs.
- Run `ruff check src tests`, `mypy src`, and `pytest` (verifying >= 30% test coverage) before completing tasks.