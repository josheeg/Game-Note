import os
from pathlib import Path


def create_uv_game_design_project(base_path: str = "roblox_game_agent"):
    """Creates a directory structure for a Python uv project with BMAD game design files."""
    project_root = Path(base_path)

    # Define directories to create
    directories = [
        project_root / ".venv",
        project_root / "src",
        project_root / "docs" / "game_design",
        project_root / "docs" / "architecture",
        project_root / "docs" / "sprints",
        project_root / "docs" / "testing",
    ]

    for directory in directories:
        directory.mkdir(parents=True, exist_ok=True)

    # Define files and their initial contents
    files = {
        # Root level configuration and meta files
        project_root
        / "pyproject.toml": """[project]
name = "roblox-game-agent"
version = "0.1.0"
description = "Python uv agent project for Roblox Game Development"
readme = "README.md"
requires-python = ">=3.11"
dependencies = []

[build-system]
requires = ["hatchling"]
build-backend = "hatchling.build"
""",
        project_root
        / "README.md": """# Roblox Game Agent (BMAD-GDS Workflow)

An automated agent-driven Python project managed with `uv` for designing and developing Roblox games.

## Setup & Execution

1. Sync virtual environment:
   ```bash
   uv sync