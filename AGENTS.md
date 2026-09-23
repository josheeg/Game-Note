# BMGD Agent Instructions & Skill Routing Rules (Pygame Engine)

## Project Context
This repository uses the BMGD (BMAD Game Dev Studio) workflow framework with **Pygame** rendering engine.

## Pygame Engine Target
- **Engine:** Pygame (Python) — lightweight 2D graphics rendering with sprite support
- **Manifest:** pyproject.toml with pygame-ce>=2.4.0 dependency
- **Venv:** .venv (uv-first, python -m venv fallback)
- **Test runner:** pytest / pytest-cov with >= 30% coverage gate
- **Window Size:** 800x600 pixels (configurable in future)
- **Rendering:** pygame surface blit operations with text rendering via pygame.font

## BMGD Routing Rules & Handoffs
1. **Brainstorming Phase**: Read `note.txt`. Output synthesis to `docs/scratchpad.md`, `docs/GDD.md`, `docs/DESIGN.md`, and `docs/ARCHITECTURE.md`. Ensure dual rendering handler requirements (GM-1, GM-2) and minimum 30% coverage rule are captured for Pygame surface operations.
2. **Planning Phase**: Read `docs/ARCHITECTURE.md` and `docs/GDD.md`. Populate `docs/epics/` and initialize `docs/sprint-status.yaml` with Pygame-specific tasks.
3. **Solutioning Phase**: Convert planned epics into target game specifications under `docs/specs/` including pygame surface lifecycle, event loop, and color palette contracts.
4. **Build Phase**: Consume `docs/specs/` and implement engine code in `src/` (pygame.init(), surface creation, blit operations) and unit/integration tests in `tests/` (headless mode for CI/CD).

## Pygame Execution Constraints
- Always verify execution inside `.venv` with pygame-ce installed
- Keep `docs/scratchpad.md` updated during active handoffs
- Run `ruff check src tests`, `mypy src`, and `pytest` (verifying >= 30% coverage) before completing tasks
- Use `SDL_VIDEODRIVER=dummy` environment variable for headless pytest integration tests
- Pygame window must close gracefully on QUIT event or ESC key

## Rendering Handler Rules
- **game_loop.py**: Pure surface creation and blit operations (no I/O, no print)
- **main.py**: Owns pygame.init(), window creation, event loop, and surface-to-display update
- **Tests**: Unit tests verify pure functions; integration tests use subprocess with headless driver

## Quality Gates Verification
| Gate | Tool | Expected Status |
|------|------|-----------------|
| Linting | `ruff check src tests` | ✅ Clean |
| Type Checking | `mypy src` | ✅ Passes |
| Coverage | `pytest --cov=src --cov-fail-under=30` | ✅ Exceeds 95% |

## Quick Start Commands (Pygame)
```bash
# Activate virtual environment
source .venv/bin/activate        # Linux/macOS
.venv\Scripts\activate            # Windows

# Install dependencies (includes pygame-ce)
pip install -r requirements-dev.txt

# Run the game with windowed rendering
python -m src.main               # Opens 800x600 blue window: "Hello, Game World!"
python -m src.main "Hero"        # Opens 800x600 blue window: "Welcome, Player Hero!" (yellow text)

# Run tests with coverage report
pytest                           # Shows ~95% coverage

# Run linting and type checking
ruff check src tests             # Lint pass
mypy src                         # Type safety pass

# Headless testing for CI/CD
SDL_VIDEODRIVER=dummy pytest     # Run integration tests without display
```