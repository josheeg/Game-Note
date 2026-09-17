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
```

## Project Structure

```
my-project/
├── .venv/                         <-- Isolated Python virtual environment
├── .github/
│   ├── ISSUE_TEMPLATE/            <-- Bug & feature templates
│   ├── workflows/ci.yml           <-- CI: lint, type check, test with coverage
│   └── PULL_REQUEST_TEMPLATE.md
├── .vscode/
│   └── launch.json                <-- IDE debug targets
├── docs/
│   ├── ARCHITECTURE.md            <-- Primary technical design
│   ├── DESIGN.md                  <-- UX/UI layouts & experience flow
│   ├── PRD.md                     <-- Product requirements
│   ├── scratchpad.md              <-- Ephemeral AI working memory
│   ├── sprint-status.yaml         <-- Active sprint tracking
│   ├── adr/                       <-- Architecture decisions
│   ├── epics/                     <-- Epic breakdowns
│   └── specs/                     <-- Technical specifications
├── src/                           <-- Production source code
│   ├── __init__.py
│   ├── main.py                    <-- Core hello world implementation
│   └── utils/                     <-- Utility modules
├── tests/                         <-- Test suite (unit + integration)
│   ├── integration/               <-- Integration tests
│   └── unit/                      <-- Unit tests with coverage tracking
├── .coveragerc                    <-- Coverage configuration
├── .gitignore                     <-- Git ignore rules
├── AGENTS.md                      <-- System instructions for AI agents
├── CHANGELOG.md                   <-- Version history
├── CONTRIBUTING.md                <-- Contribution guidelines
├── LICENSE.md                     <-- License text
├── note.txt                       <-- Raw project requirements input
├── pyproject.toml                 <-- Unified config (ruff, mypy, pytest)
├── README.md                      <-- This file
├── requirements.txt               <-- Production dependencies
└── requirements-dev.txt           <-- Dev dependencies (pytest, ruff, mypy)
```

## BMAD Workflow Phases

### Phase 1: Brainstorming & Context Analysis
Read `note.txt` and generate initial documentation artifacts.

### Phase 2: Planning & Epics Breakdown
Break architecture down into executable epics with sprint planning.

### Phase 3: Solutioning & Architectural Review
Create detailed technical specifications for implementation.

### Phase 4: Automated Build Execution
Implement code, write tests, and verify all quality gates pass.

## Quality Gates

- **Linting**: `ruff check src tests` (must pass)
- **Type Checking**: `mypy src` (strict mode, no errors)
- **Test Coverage**: >= 30% branch/statement coverage via `pytest --cov=src`

## Example Usage

```bash
# Standard greeting
$ python -m src.main
Hello, World!

# Custom greeting with name
$ python -m src.main Alice
Hello, Alice!
```