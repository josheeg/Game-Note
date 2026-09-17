# Game-Note Skill Specification

## Overview

The `game-note` skill automates the transition from a raw project note (`note.txt`) to full project scaffolding, virtual environment setup, agent routing, context propagation, and automated build execution via the BMAD (Brainstorming, Mindset, Architecture, Development) framework.

## Primary Input
- `note.txt`: Raw project notes, initial feature ideas, testing constraints, target coverage requirements

## Target Directory Layout
Production-ready Python repository with:
- Isolated `.venv` virtual environment
- GitHub CI actions (linting, type-checking, test coverage)
- VS Code debug configurations
- BMAD execution documentation (`AGENTS.md`, `scratchpad.md`, `PRD.md`, `ARCHITECTURE.md`, `sprint-status.yaml`)

## Primary Objectives

1. **Enforce strict sequential context passing** across BMAD agents to eliminate context drift
2. **Bootstrap isolated Python virtual environment** (`.venv`) with automated linting (`ruff`), type-checking (`mypy`), and test coverage reporting (`pytest-cov`)
3. **Validate project requirements** (e.g., multi-route output and specific coverage targets like 30% threshold)

## End-to-End Sequential Pipeline

```
┌─────────────────────────────────────────────────────────────┐
│ STEP 1: Brainstorming & Context Analysis                      │
│  @bmad-project-context ──► @bmad-brainstorming ──►           │
│  @bmad-deep-recon ──► @bmad-product-brief ──►                 │
│  @bmad-prfaq ──► @bmad-forge-idea ──►                         │
│  @bmad-prd ──► @bmad-ux ──► @bmad-architecture                │
└─────────────────────────────────────────────────────────────┘
         │
         ▼ Outputs: docs/scratchpad.md, PRD.md, DESIGN.md, ARCHITECTURE.md
```

```
┌─────────────────────────────────────────────────────────────┐
│ STEP 2: Planning & Epics Breakdown                             │
│  @bmad-architecture ──► @bmad-create-epics-and-stories ──►   │
│  @bmad-sprint-planning ──► @bmad-deep-recon                   │
└─────────────────────────────────────────────────────────────┘
         │
         ▼ Outputs: docs/epics/*, docs/sprint-status.yaml
```

```
┌─────────────────────────────────────────────────────────────┐
│ STEP 3: Solutioning & Architectural Review                      │
│  @bmad-spec ──► @bmad-retrospective ──►                       │
│  @bmad-deep-recon ──► @bmad-review                            │
└─────────────────────────────────────────────────────────────┘
         │
         ▼ Outputs: docs/specs/*, docs/scratchpad.md (sign-off)
```

```
┌─────────────────────────────────────────────────────────────┐
│ STEP 4: Automated Build Execution & Verification                 │
│  @bmad-build-auto (or @bmad-build)                              │
└─────────────────────────────────────────────────────────────┘
         │
         ▼ Outputs: src/*, tests/*, verified test suite
```

## Context Routing & Artifact Matrix

| Phase | Sequential Agents | Key Output Artifacts Generated |
|-------|-------------------|-------------------------------|
| 1.1 Context Setup | `@bmad-project-context` | `docs/scratchpad.md` (initial state) |
| 1.2 Brainstorm & Recon | `@bmad-brainstorming`, `@bmad-deep-recon` | Feature breakdown & technical feasibility matrix |
| 1.3 Product Vision | `@bmad-product-brief`, `@bmad-prfaq`, `@bmad-forge-idea` | Product vision statement & target use cases |
| 1.4 Requirements & UX | `@bmad-prd`, `@bmad-ux` | `docs/PRD.md`, `docs/DESIGN.md` |
| 1.5 Technical Architecture | `@bmad-architecture` | `docs/ARCHITECTURE.md`, `docs/adr/0001-*.md` |
| 2.1 Epics & Stories | `@bmad-create-epics-and-stories` | `docs/epics/epic-*.md` |
| 2.2 Sprint Planning | `@bmad-sprint-planning`, `@bmad-deep-recon` | `docs/sprint-status.yaml` |
| 3.1 Detailed Specs | `@bmad-spec` | `docs/specs/spec-*.md` |
| 3.2 Review & Gatekeeping | `@bmad-retrospective`, `@bmad-deep-recon`, `@bmad-review` | `docs/scratchpad.md` (Build Ready signoff) |
| 4.1 Execution & Testing | `@bmad-build-auto` / `@bmad-build` | Source code (`src/`), Unit/Integration tests (`tests/`) |

## Directory Structure

```
my-project/
├── .venv/                         <-- Isolated Python virtual environment
├── .github/
│   ├── ISSUE_TEMPLATE/
│   │   ├── bug_report.md
│   │   └── feature_request.md
│   ├── workflows/
│   │   └── ci.yml                 <-- Runs ruff, mypy, pytest, and coverage checks
│   └── PULL_REQUEST_TEMPLATE.md
├── .vscode/
│   └── launch.json                <-- IDE debug targets (debugpy/ipdb)
├── docs/
│   ├── ARCHITECTURE.md            <-- Primary technical design & system spine (@bmad-architecture)
│   ├── DESIGN.md                  <-- UX/UI layouts & experience flow (@bmad-ux)
│   ├── PRD.md                     <-- Product requirements (@bmad-prd)
│   ├── scratchpad.md              <-- Ephemeral AI working memory & active execution context
│   ├── sprint-status.yaml         <-- Active tracking file (@bmad-sprint-planning)
│   ├── adr/
│   │   └── 0001-record-initial-architecture.md
│   ├── epics/                     <-- Output from @bmad-create-epics-and-stories
│   └── specs/                     <-- Output from @bmad-spec
├── src/
│   ├── __init__.py
│   ├── main.py
│   └── utils/
│       └── __init__.py
├── tests/
│   ├── integration/
│   │   └── __init__.py
│   └── unit/
│       ├── __init__.py
│       └── test_main.py
├── .coveragerc                    <-- Standalone coverage config
├── .gitignore                     <-- Standard rules (includes .venv/, *.pyc, .memlog.md)
├── AGENTS.md                      <-- System instructions & skill routing rules for AI agents
├── CHANGELOG.md
├── CONTRIBUTING.md
├── LICENSE.md
├── note.txt                       <-- Raw project requirement inputs
├── pyproject.toml                 <-- Unified config for tool.ruff, tool.mypy, tool.pytest, tool.coverage
├── README.md
├── requirements.txt               <-- Production dependencies
└── requirements-dev.txt           <-- Dev dependencies (pytest, pytest-cov, ruff, mypy, debugpy)
```

## Sequential Prompt Sequence for Agent Execution

Execute these four prompt steps sequentially in your agent execution environment to pass context smoothly through the pipeline:

### Step 1: Brainstorming & Analysis Phase
```text
@bmad-project-context @bmad-brainstorming @bmad-deep-recon @bmad-product-brief @bmad-prfaq @bmad-forge-idea @bmad-prd @bmad-ux @bmad-architecture

Read `note.txt` and `AGENTS.md`.
1. Analyze the project notes and target test coverage requirement (>=30%).
2. Synthesize feature requirements (e.g., dual hello world handlers and minimum 30% test coverage).
3. Generate `docs/PRD.md` with explicit functional and non-functional requirements.
4. Generate `docs/DESIGN.md` defining interface expectations.
5. Generate `docs/ARCHITECTURE.md` defining code component structure and test boundary constraints.
6. Record active state and decision log in `docs/scratchpad.md`.
```

### Step 2: Planning Phase
```text
@bmad-architecture @bmad-create-epics-and-stories @bmad-sprint-planning @bmad-deep-recon

Read `docs/ARCHITECTURE.md` and `docs/PRD.md`.
1. Break architecture down into epics stored under `docs/epics/`.
2. Initialize and populate `docs/sprint-status.yaml` with active Sprint 1 tasks.
3. Log state updates in `docs/scratchpad.md`.
```

### Step 3: Solutioning & Architectural Review Phase
```text
@bmad-spec @bmad-retrospective @bmad-deep-recon @bmad-review

Read `docs/sprint-status.yaml` and `docs/epics/`.
1. Generate detailed technical specifications for Sprint 1 under `docs/specs/`.
2. Perform architectural retrospective and verify that unit test requirements hit the >=30% coverage threshold target.
3. Record build readiness sign-off in `docs/scratchpad.md`.
```

### Step 4: Automated Build & Execution Phase
```text
@bmad-build-auto @bmad-build

Read `docs/specs/`, `docs/sprint-status.yaml`, and `AGENTS.md`.
1. Activate `.venv` environment context.
2. Build source code files in `src/` according to target specifications.
3. Build corresponding unit and integration tests under `tests/`.
4. Run `ruff check src tests`, `mypy src`, and `pytest`. Fix any failing checks or coverage deficits until all pass cleanly.
5. Update `docs/sprint-status.yaml` marking completed tasks as done.
```

## Execution Example (note.txt Output Verification)

### Input note.txt
```text
simple hello world like test program
request 1: standard console hello world message
request 2: personalized hello world message with custom target name
minimum test coverage target: 30%
the projects note that goes into brainstorming
```

### Generated docs/PRD.md (Example Output)
```markdown
# Product Requirements Document (PRD)

## 1. Overview
A CLI application providing standardized and custom hello-world outputs while maintaining verified test coverage >= 30%.

## 2. Requirements
- **FR-1 (Request 1):** Default execution prints `"Hello, World!"`.
- **FR-2 (Request 2):** Parameterized execution prints `"Hello, <Name>!"`.
- **NFR-1:** Unit test suite must achieve at least 30% branch/statement coverage verified via `pytest-cov`.
```

### Verified Test Output
```
============================= test session starts ==============================
rootdir: /path/to/my-project
configfile: pyproject.toml
testpaths: tests
plugins: cov-4.1.0
collected 2 items

tests/unit/test_main.py ..                                              [100%]

---------- coverage: platform linux, python 3.10.x -----------
Name          Stmts   Miss  Cover
---------------------------------
src/main.py       8      2    75%
---------------------------------
TOTAL             8      2    75%

Required test coverage of 30.0% reached. Total coverage: 75.00%
============================== 2 passed in 0.08s ===============================
```

## Scaffolding Script

The project can be bootstrapped using the `scaffold.sh` script:

```bash
# Create new project from scratch
bash scaffold.sh my-new-project

# Navigate into project
cd my-new-project

# Activate virtual environment
source .venv/bin/activate

# Install dependencies
pip install -r requirements-dev.txt

# Run tests to verify setup
pytest
```

## Quality Standards

- **Linting**: `ruff check src tests` (must pass without errors)
- **Type Checking**: `mypy src` (strict mode enabled)
- **Test Coverage**: Minimum 30% branch/statement coverage enforced by `pytest-cov`
- **CI/CD**: GitHub Actions workflow validates all quality gates on every push and PR

## Notes

- Always activate `.venv` before running development commands
- Keep `docs/scratchpad.md` updated during active BMAD agent handoffs
- Run full quality gate checks (`ruff`, `mypy`, `pytest`) before completing any task