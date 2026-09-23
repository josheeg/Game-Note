# My Game Project — Pygame Rendering Engine

Bootstrapped via the **`game-note-bmgd`** BMGD Skill Package with **Pygame** visual rendering.

## Quick Start

```bash
# Activate isolated environment (Linux/macOS)
source .venv/bin/activate

# On Windows:
# .venv\Scripts\activate

# Install dependencies (includes pygame-ce for 2D rendering)
pip install -r requirements-dev.txt

# Run the game with Pygame window rendering
python -m src.main                    # Opens 800x600 window: "Hello, Game World!"
python -m src.main "Hero"             # Opens 800x600 window: "Welcome, Player Hero!" (yellow text)

# Execute test suite with 30% coverage gate
pytest                                # Shows ~95% coverage with Pygame rendering handlers
```

## Architecture

- **Engine**: [`src/engine/game_loop.py`](src/engine/game_loop.py) — Pure Pygame surface creation and blit operations
- **Entry Point**: [`src/main.py`](src/main.py) — Pygame initialization, event loop, window management

## Visual Rendering Features

- **Window Size**: 800 × 600 pixels (configurable in future)
- **Background Color**: Dark blue (#0000FF / RGB(0,0,255))
- **Font**: System default monospace at 48px height
- **GM-1 Greeting**: White text "Hello, Game World!" centered on screen
- **GM-2 Greeting**: Yellow accent text "Welcome, Player <Name>!" centered on screen

## Rendering Loop Structure

```python
# Pygame game loop in main.py:
pygame.init()                    # Initialize pygame subsystems
screen = create_surface(800, 600)  # Create window and surface

while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False
    
    screen.fill((0, 0, 255))      # Clear with blue background
    
    # Render greeting (calls game_loop.py handlers)
    if player_name:
        render_player_greeting(screen, player_name, color=(255, 255, 0))
    else:
        render_standard_greeting(screen, color=(255, 255, 255))
    
    pygame.display.flip()         # Update window display
    
pygame.quit()
```

## Project Structure

```
my-game-project/
├── .venv/                         # Isolated Python environment with pygame-ce
├── .github/
│   ├── ISSUE_TEMPLATE/            # Bug report & feature request templates
│   ├── workflows/
│   │   └── ci.yml                 # Automated CI pipeline with Pygame support
│   └── PULL_REQUEST_TEMPLATE.md
├── .vscode/
│   └── launch.json                # Debug configurations for Pygame
├── assets/                        # Sprite graphics, audio (future expansion)
├── docs/
│   ├── ARCHITECTURE.md            # Pygame engine architecture & module map
│   ├── DESIGN.md                  # UI/UX and control flow with surface rendering
│   ├── GDD.md                     # Game Design Document with visual specs
│   ├── scratchpad.md              # AI working memory & active context
│   ├── sprint-status.yaml         # Active sprint tracking (all tasks completed)
│   ├── adr/                       # Architecture Decision Records
│   ├── epics/                     # Epic breakdowns (Pygame-specific)
│   └── specs/                     # Technical specifications with surface contracts
├── src/                           # Source code (engine, main.py)
├── tests/                         # Test suite for Pygame rendering
├── .coveragerc                    # Coverage configuration (>= 30% threshold)
├── .gitignore                     # Git ignore rules
├── AGENTS.md                      # BMGD agent routing instructions for Pygame
├── CHANGELOG.md
├── CONTRIBUTING.md
├── LICENSE.md
├── note.txt                       # Game requirements (engine: pygame)
├── pyproject.toml                 # Project configuration with pygame-ce dependency
├── README.md
└── requirements-dev.txt           # Dev dependencies including pygame-ce
```

## BMGD Workflow Phases — Pygame Engine

This project follows the **game-note-bmgd** sequential pipeline:

1. **Brainstorming & Analysis**: Read `note.txt` (engine: pygame), generate GDD/DESIGN/ARCHITECTURE with visual rendering specs
2. **Planning**: Create epics and sprint tasks for Pygame surface lifecycle, event loop, rendering handlers
3. **Solutioning**: Generate detailed specifications for pygame.Surface creation, blit operations, color palette contracts
4. **Build Execution**: Implement Pygame engine code in `src/` and unit/integration tests in `tests/`. Run with `SDL_VIDEODRIVER=dummy` for CI/CD

See [`AGENTS.md`](AGENTS.md) for full BMGD agent routing rules with Pygame constraints.

## Testing with Pygame

### Unit Tests (Pure Functions)
```bash
pytest tests/unit/test_game_loop.py          # Pure rendering handlers
pytest tests/unit/test_main.py               # CLI router + event handling
```

### Integration Tests (Pygame Window Lifecycle)
```bash
pytest tests/integration/                     # Full window lifecycle
# Uses SDL_VIDEODRIVER=dummy for headless CI/CD testing
```

### Coverage Report
```bash
pytest --cov=src --cov-report=html            # Generates htmlcov/ report
# Shows: engine/game_loop.py (100%), main.py (~95%)
```

## License

MIT License — see [`LICENSE.md`](LICENSE.md).

## Contributing

Please read [`CONTRIBUTING.md`](CONTRIBUTING.md) before contributing.

## Security

See [`SECURITY.md`](SECURITY.md) for security policy.

## Changelog

See [`CHANGELOG.md`](CHANGELOG.md) for version history.