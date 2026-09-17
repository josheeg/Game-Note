#!/usr/bin/env bash
set -e

PROJECT_NAME=${1:-"my-project"}

echo "🚀 Scaffolding game-note project structure for: $PROJECT_NAME..."

# 1. Create repository directory tree
mkdir -p "$PROJECT_NAME"/{.github/ISSUE_TEMPLATE,.github/workflows,.vscode,docs/adr,docs/epics,docs/specs,src/utils,tests/integration,tests/unit}

cd "$PROJECT_NAME"

# 2. Virtual environment setup
echo "🐍 Creating isolated Python virtual environment in .venv..."
python3 -m venv .venv

# 3. Create initial note.txt with project requirements and test coverage target
if [ ! -f "note.txt" ]; then
cat << 'EOF' > note.txt
simple hello world like test program
request 1: standard console hello world message
request 2: personalized hello world message with custom target name
minimum test coverage target: 30%
the projects note that goes into brainstorming
EOF
fi

# 4. pyproject.toml (Unified configuration for ruff, mypy, pytest, coverage)
cat << 'EOF' > pyproject.toml
[build-system]
requires = ["setuptools>=61.0"]
build-backend = "setuptools.build_meta"

[project]
name = "my-project"
version = "0.1.0"
description = "Project bootstrapped via game-note BMAD skill"
readme = "README.md"
requires-python = ">=3.10"
dependencies = []

[tool.ruff]
line-length = 88
target-version = "py310"

[tool.mypy]
python_version = "3.10"
strict = true
ignore_missing_imports = true

[tool.pytest.ini_options]
minversion = "7.0"
addopts = "-ra -q --cov=src --cov-fail-under=30"
testpaths = ["tests"]

[tool.coverage.run]
source = ["src"]
branch = true

[tool.coverage.report]
show_missing = true
fail_under = 30
EOF

# 5. AGENTS.md (System Instructions & Skill Routing Rules)
cat << 'EOF' > AGENTS.md
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
EOF

# 6. CI Workflow & Templates
cat << 'EOF' > .github/workflows/ci.yml
name: CI Workflow

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main ]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.10'
      - name: Install dependencies
        run: |
          python -m pip install --upgrade pip
          pip install ruff mypy pytest pytest-cov
          if [ -f requirements.txt ]; then pip install -r requirements.txt; fi
          if [ -f requirements-dev.txt ]; then pip install -r requirements-dev.txt; fi
      - name: Lint with Ruff
        run: ruff check src tests
      - name: Type check with Mypy
        run: mypy src
      - name: Run Test Suite with Coverage (>=30%)
        run: pytest
EOF

cat << 'EOF' > .github/ISSUE_TEMPLATE/bug_report.md
---
name: Bug Report
about: Report a bug or issue
title: '[BUG] '
labels: bug
---
## Description
Brief summary of the issue.

## Steps to Reproduce
1. Execute `...`
2. Observe error output.
EOF

cat << 'EOF' > .github/ISSUE_TEMPLATE/feature_request.md
---
name: Feature Request
about: Suggest a feature or enhancement
title: '[FEAT] '
labels: enhancement
---
## Feature Description
Detailed explanation of proposed feature.
EOF

cat << 'EOF' > .github/PULL_REQUEST_TEMPLATE.md
## Summary of Changes
- Linked Spec/Epic:

## Verification Checklist
- [ ] Tests passed (`pytest` with >= 30% coverage)
- [ ] Linting clean (`ruff check src tests`)
- [ ] Type checks clean (`mypy src`)
EOF

# 7. VS Code Debugging Config
cat << 'EOF' > .vscode/launch.json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Python: Main Module",
            "type": "debugpy",
            "request": "launch",
            "program": "${workspaceFolder}/src/main.py",
            "console": "integratedTerminal",
            "justMyCode": true
        },
        {
            "name": "Python: Pytest Target",
            "type": "debugpy",
            "request": "launch",
            "module": "pytest",
            "args": ["${workspaceFolder}/tests"],
            "console": "integratedTerminal"
        }
    ]
}
EOF

# 8. Documentation Files
cat << 'EOF' > docs/scratchpad.md
# Ephemeral Working Memory

## Active Context
- Skill: `game-note`
- Input Source: `note.txt`
- Status: Initialized
EOF

cat << 'EOF' > docs/sprint-status.yaml
current_sprint: 1
status: initialization
epics: []
active_tasks: []
completed_tasks: []
EOF

cat << 'EOF' > docs/adr/0001-record-initial-architecture.md
# 1. Record Initial Architecture

* Status: Accepted
* Date: $(date +%Y-%m-%d)

## Context
Initial project bootstrapping driven by `game-note` skill automation from `note.txt`.

## Decision
Adopt standard Python package architecture with strict linting, type checks, and isolated unit/integration tests with a minimum coverage threshold of 30%.
EOF

# 9. Source Code & Initial Test Suite
cat << 'EOF' > src/__init__.py
"""Main package initialization."""
__version__ = "0.1.0"
EOF

cat << 'EOF' > src/main.py
import sys

def get_standard_greeting() -> str:
    """Request 1: Default console hello world message."""
    return "Hello, World!"

def get_custom_greeting(name: str) -> str:
    """Request 2: Personalized hello world message."""
    return f"Hello, {name}!"

def main() -> None:
    if len(sys.argv) > 1:
        print(get_custom_greeting(sys.argv[1]))
    else:
        print(get_standard_greeting())

if __name__ == "__main__":
    main()
EOF

cat << 'EOF' > src/utils/__init__.py
"""Utilities package."""
EOF

cat << 'EOF' > tests/unit/__init__.py
"""Unit tests package."""
EOF

cat << 'EOF' > tests/integration/__init__.py
"""Integration tests package."""
EOF

cat << 'EOF' > tests/unit/test_main.py
from src.main import get_standard_greeting, get_custom_greeting

def test_standard_greeting() -> None:
    assert get_standard_greeting() == "Hello, World!"

def test_custom_greeting() -> None:
    assert get_custom_greeting("Alice") == "Hello, Alice!"
EOF

# 10. Root Environment Files
cat << 'EOF' > .gitignore
.venv/
__pycache__/
*.py[cod]
*$py.class
.pytest_cache/
.coverage
htmlcov/
.mypy_cache/
.vscode/
docs/scratchpad.md
EOF

cat << 'EOF' > .coveragerc
[run]
branch = True
source = src

[report]
show_missing = True
fail_under = 30
exclude_lines =
    pragma: no cover
    if __name__ == .__main__.:
EOF

cat << 'EOF' > README.md
# My Project

Bootstrapped via the **`game-note`** BMAD Skill.

## Quick Start
```bash
# Activate isolated environment
source .venv/bin/activate

# Install dependencies
pip install -r requirements-dev.txt

# Run main program
python -m src.main

# Run test suite and check coverage
pytest
EOF

cat << 'EOF' > requirements.txt

Production dependencies

EOF

cat << 'EOF' > requirements-dev.txt
pytest>=7.0.0
pytest-cov>=4.0.0
ruff>=0.1.0
mypy>=1.0.0
debugpy>=1.6.0
EOF

cat << 'EOF' > CHANGELOG.md

Changelog

[0.1.0] - Initial Release

Project initialized via game-note scaffolding.
EOF

cat << 'EOF' > CONTRIBUTING.md

Contributing Guidelines

Ensure code passes ruff check src tests and mypy src.

Ensure test coverage remains at or above 30% (pytest).
EOF

cat << 'EOF' > LICENSE.md
MIT License
EOF

cat << 'EOF' > SECURITY.md

Security Policy

Please report security issues via maintainer contact.
EOF

echo "✅ Project scaffolding complete in './$PROJECT_NAME'!"