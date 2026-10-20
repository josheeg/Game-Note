BMGD (BMad Game Development) Godot Project Setup & Workflow GuideThis guide details the step-by-step process for initializing, designing, and engineering a Godot game project using the BMGD AI Workflow System, along with modern Python tooling (uv, pydantic, pytest, ruff, mypy), vector graphics setup (svg), and Continuous Integration (CI).1. Environment & Tooling SetupWe use uv for fast Python virtual environment and dependency management. Python scripts support external tooling, data validation, pipeline builds, and automated testing integrations.Initializing the Python Environment# Create virtual environment using uv
uv venv .venv

# Activate virtual environment
# On Linux/macOS:
source .venv/bin/activate
# On Windows:
# .venv\Scripts\activate

# Install development, testing, and linting dependencies
uv pip install pytest pydantic ruff mypy cairosvg
2. BMGD AI Workflow SystemBMGD uses dedicated AI Agent personas (Game Architect, Game Designer, Game QA) to drive project structure and design assets through a systematic step-by-step workflow.                  ┌──────────────────────────────┐
                  │ /bmgd-generate-project-context │  Step 2
                  └──────────────┬───────────────┘
                                 │
                                 ▼
                    ┌──────────────────────────┐
                    │  /bmgd-brainstorm-game   │     Step 3
                    └────────────┬─────────────┘
                                 │
                                 ▼
                     ┌────────────────────────┐
                     │    /bmgd-game-brief    │      Step 4
                     └───────────┬────────────┘
                                 │
                                 ▼
                     ┌────────────────────────┐
                     │    /bmgd-create-gdd    │      Step 5
                     └───────────┬────────────┘
                                 │
                                 ▼
                   ┌────────────────────────────┐
                   │  /bmgd-create-architecture │    Step 6
                   └─────────────┬──────────────┘
                                 │
                                 ▼
                     ┌────────────────────────┐
                     │  /bmgd-test-framework  │      Step 7
                     └────────────────────────┘
Step 1: Initialize Godot ProjectCreate a new Godot project directory and launch Godot Engine to generate the base project.godot file before initializing BMGD tools.Step 2: Generate Project ContextMaintain consistency across all AI-driven workflows by initializing project parameters./bmgd-generate-project-context
Agent: Game Architect (Cloud Dragonborn)Output: project-context.mdContents:Project name and descriptionTarget platforms (PC, Mobile, Web)Godot engine version and renderer choice (Forward+, Mobile, Compatibility)Frame time and memory performance budgetsCritical technical parameters and constraintsStep 3: Run Brainstorming WorkflowDefine and refine your core game concept with guided techniques./bmgd-brainstorm-game
Agent: Game Designer (Samus Shepard)Outputs & Tasks:Selecting and combining brainstorming techniquesGenerating, filtering, and refining core gameplay hooksFinalizing a primary concept for production developmentStep 4: Create Game BriefCapture vision, target audience, and market positioning./bmgd-game-brief
Agent: Game Designer (Samus Shepard)Output: game-brief.mdContents:Game vision and elevator pitchTarget audience and market positioningPlatform and genre decisionsCompetitive analysisArt and audio style directionStep 5: Design Your Game (GDD)Build a comprehensive Game Design Document using specialized templates./bmgd-create-gdd
Agent: Game Designer (Samus Shepard)Output: gdd.mdContents:Selection from 24 specialized game design templatesCore gameplay mechanics and loop definitionsProgression formulas and system balancingLevel structures, narrative flows, and content listsAsset requirements (art, sound, animation)Step 6: Create Technical ArchitecturePlan scene trees, node topologies, and decoupling patterns./bmgd-create-architecture
Agent: Game Architect (Cloud Dragonborn)Outputs: architecture.md, sprint-status.yaml, stories/ directory.Contents:Directory, scene, and script structureGame loop, Node hierarchies, Autoload Singletons, and Signal patternsResource management and Godot composition patternsFPS & Memory optimization strategiesExport profiles and platform configurationsStep 7: Testing Framework SetupImplement automated tests using GUT (Godot Unit Test)./bmgd-test-framework
Agent: Game QA (GLaDOS)Output: Test suites (test/unit/, test/integration/) and GUT configuration.Contents:Unit tests for pure GDScript logicIntegration tests for scene trees and node interactionsTest fixtures and mock doubles3. What You Get (Deliverables Overview)File / FolderPurposeproject-context.mdAI context and technical constraints for consistency across BMGD workflowsgame-brief.mdGame vision, elevator pitch, target audience, and positioninggdd.mdComplete Game Design Document detailing mechanics and loopsarchitecture.mdTechnical design, node hierarchies, singletons, and Godot patternssprint-status.yamlTask board tracking agile stories and development progressstories/Directory containing individual user story markdown filesscripts_py/Python helper toolset (uv, pydantic, ruff, mypy, SVG pipeline).github/workflows/CI/CD automated test and linting pipeline4. Godot-Specific ConsiderationsDirectory StructureBMGD recommends a modular, scene-oriented folder structure:res://
├── .godot/
├── assets/
│   ├── art/
│   │   ├── raw_svg/          # Vector source files
│   │   └── textures/         # Processed textures / rasterized assets
│   ├── audio/
│   │   ├── music/
│   │   └── sfx/
│   └── data/                 # Game balancing JSON/YAML configs
├── scenes/
│   ├── levels/               # Playable maps and stages
│   ├── characters/           # Player, NPC, Enemy scenes
│   ├── ui/                   # HUD, Menus, Dialogs
│   └── components/           # Reusable composition nodes (e.g. HealthComponent)
├── scripts/
│   ├── autoload/             # Global Singletons (Gamestate, SoundManager)
│   └── utils/                # Helper algorithms and tools
├── test/                     # GUT unit and integration tests
├── project.godot             # Godot Engine Configuration
├── project-context.md        # BMGD Context File
├── game-brief.md             # Vision & Strategy Document
├── gdd.md                    # Detailed GDD
├── architecture.md           # Architecture Specification
├── sprint-status.yaml        # Sprint tracking
└── stories/                  # Backlog user stories
Scene Organization & Architecture PatternsGodot uses a tree of nodes. Your architecture specifies:Autoload Singletons: Global managers for game state, settings, audio management, and save files.Scene Composition: Modular, reusable scenes attached to entities (e.g., HitboxComponent, HealthComponent).Signal Patterns: Decoupled node communication ("Call down, Signal up").Performance BudgetsTarget frame times and performance benchmarks configured in architecture.md:60 FPS (16.6ms frame budget): General target for standard games.30 FPS (33.3ms frame budget): Target for mobile devices or heavy computational simulations.144+ FPS (6.9ms frame budget): Competitive high-framerate target.5. Python Helper Utilities (Pydantic, Ruff, Mypy, SVG Pipeline)To validate external configuration data (JSON/YAML) before importing into Godot or building assets, we use Python scripts configured with Pydantic.Config Schema (scripts_py/validate_configs.py)from pathlib import Path
from pydantic import BaseModel, Field, PositiveInt

class CharacterStats(BaseModel):
    name: str
    max_hp: PositiveInt
    speed: float = Field(gt=0.0)
    base_attack: int

class GameBalanceConfig(BaseModel):
    version: str
    player: CharacterStats

def validate_all_configs(config_path: Path) -> None:
    with open(config_path, "r", encoding="utf-8") as f:
        data = f.read()
    config = GameBalanceConfig.model_validate_json(data)
    print(f"Config valid for version: {config.version}")

if __name__ == "__main__":
    validate_all_configs(Path("assets/data/balance.json"))
Static Analysis Configsruff.tomltarget-version = "py311"
line-length = 100
select = ["E", "F", "I", "N", "UP", "B"]
ignore = []

[format]
quote-style = "double"
mypy.ini[mypy]
python_version = 3.11
strict = True
ignore_missing_imports = True
SVG Vector Rasterization Pipeline (scripts_py/process_svgs.py)Godot native UI and 2D components can draw directly from rasterized vector atlases. The CairoSVG pipeline automatically processes raw vector source files into game-ready textures:import os
from pathlib import Path
import cairosvg

SVG_DIR = Path("assets/art/raw_svg")
OUTPUT_DIR = Path("assets/art/textures")

def convert_svgs():
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    for svg_file in SVG_DIR.glob("*.svg"):
        output_path = OUTPUT_DIR / f"{svg_file.stem}.png"
        cairosvg.svg2png(url=str(svg_file), write_to=str(output_path), output_width=512, output_height=512)
        print(f"Converted {svg_file.name} -> {output_path.name}")

if __name__ == "__main__":
    convert_svgs()
6. Automated CI/CD Pipeline (.github/workflows/ci.yml)The GitHub Actions workflow below executes Python linting/tests and runs headless Godot unit tests using GUT.name: BMGD CI/CD Pipeline

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main, develop ]

jobs:
  python-lint-and-validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Install uv
        uses: astral-sh/setup-uv@v2
        with:
          version: "latest"

      - name: Set up Python
        uses: actions/setup-python@v5
        with:
          python-version: "3.11"

      - name: Install Python Dependencies
        run: |
          uv venv
          uv pip install pytest pydantic ruff mypy cairosvg

      - name: Run Ruff (Linter & Formatter)
        run: |
          uv run ruff check .
          uv run ruff format --check .

      - name: Run Mypy (Type Check)
        run: |
          uv run mypy scripts_py/

      - name: Validate Game Data Configs
        run: |
          uv run python scripts_py/validate_configs.py

  godot-gut-tests:
    needs: python-lint-and-validate
    runs-on: ubuntu-latest
    container:
      image: barichello/godot-ci:4.2.1
    steps:
      - uses: actions/checkout@v4

      - name: Import Godot Assets
        run: godot --headless --editor --quit

      - name: Run GUT Unit & Integration Tests
        run: godot --headless -s addons/gut/gut_cmdln.gd -gdir=res://test -gexit
