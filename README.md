prompt for #bmad-note a note.txt project getting started skill that takes a text file note.txt and uses bmad framework to brainstorm reserch plan develp.  create helpfil files and virtual enviroment.

skill.md for bionic ai name it bmad-note note.txt goes into /bmad-brainstorming and  /bmad-project-context and bmad skills passing files to /bmad-build-auto with stories does this also setup the directory agents.md readme.md is it usin all the .md files to cover spec development lint coverage tests how are files handled from skill to skill debugging plan.md planning first quick start file todo list memory for ai tasks.md virtual enviroment venv


name: bmad-note
description: Captures raw ideation notes into dual workspace locations, orchestrates multi-stage BMAD skills passing story files to /bmad-build-auto, bootstraps directory-level AGENTS.md, README.md, and tasks.md files, enforces planning-first specs, manages venv execution, linting, test coverage, and orchestrates automated debugging workflows via debugging-plan.md.
disable-model-invocation: falseBMAD Note & Orchestration Skill (bmad-note)OverviewThe bmad-note skill implements the Breakthrough Method for Agile AI-Driven Development (BMAD) framework in Bionic AI. It provides a complete, deterministic pipeline from raw idea capture (note.txt) to automated build, linting, testing, virtual environment execution (venv), dynamic task memory tracking (tasks.md), and issue triage (debugging-plan.md).Quick Start GuideTrigger the Skill:@bmad-note We need a user authentication service with JWT verification, OAuth2 support, and a CLI test utility.
Directory Bootstrapping:
Bionic initializes the project directories, dual-syncs note.txt to /bmad-brainstorming/ and /bmad-project-context/, and seeds AGENTS.md, README.md, and tasks.md in each location.Execution Sequence:Planning: Generates plan.md in each active stage directory before producing downstream artifacts.Task Tracking: Maintains real-time status in tasks.md across all stages.Context & Architecture: Synthesizes /bmad-project-context/prd.md, /bmad-architecture/tech-spec.md, and decision records (adr-[id].md).Story Breakdown: Decomposes specs into self-contained /bmad-story-breakdown/story-[id].md files.Build & QA in venv: Handoffs stories to /bmad-build-auto/, executes builds within an isolated Python venv, enforces static lint rules (lint-spec.md), and verifies test coverage ($\ge 85\%$).Automated Debugging: If build, lint, or coverage checks fail, Bionic triggers the debugging-plan.md triage workflow.Workspace Directory Architecture & Artifact Mapping.
├── AGENTS.md                                # Root system constraints & global quality gates
├── README.md                                # Project-wide navigation and architecture index
├── tasks.md                                 # Global master task memory & execution queue
├── bmad-brainstorming/
│   ├── AGENTS.md                            # Brainstorming agent constraints
│   ├── README.md                            # Index of ideation sessions
│   ├── tasks.md                             # Brainstorming local task memory
│   ├── note.txt                             # Raw idea mirror (dual sync)
│   └── ideation-[date].md                   # Mindmaps, feature options, trade-offs
├── bmad-project-context/
│   ├── AGENTS.md                            # Context synthesis agent rules
│   ├── README.md                            # Domain and product overview
│   ├── tasks.md                             # Context stage task memory
│   ├── note.txt                             # Raw context mirror (dual sync)
│   ├── plan.md                              # Planning document for PRD synthesis
│   └── prd.md                               # Product Requirements Document
├── bmad-architecture/
│   ├── AGENTS.md                            # Technical architecture constraints
│   ├── README.md                            # Architectural index
│   ├── tasks.md                             # Architecture stage task memory
│   ├── plan.md                              # Architectural strategy plan
│   ├── tech-spec.md                         # Technical Specification & System Design
│   └── adr-[id].md                          # Architectural Decision Records
├── bmad-story-breakdown/
│   ├── AGENTS.md                            # Decomposition & DoR validation rules
│   ├── README.md                            # Backlog and story index
│   ├── tasks.md                             # Story breakdown task memory
│   ├── plan.md                              # Breakdown strategy and sequencing plan
│   └── story-[id].md                        # Granular user stories with DoD & test contracts
└── bmad-build-auto/
    ├── AGENTS.md                            # Execution, testing, & linting rules
    ├── README.md                            # Pipeline build status dashboard
    ├── tasks.md                             # Automated build task memory & status
    ├── plan.md                              # Build execution plan & order of work
    ├── venv-config.md                       # Virtual environment setup & dependency rules
    ├── lint-spec.md                         # Project-wide linting & formatting standards
    ├── test-plan.md                         # Unit, integration, and E2E test suite matrix
    ├── coverage-report.md                   # Test coverage metrics & line/branch analysis
    ├── debugging-plan.md                    # Root-cause analysis, triage, & reproduction steps
    └── story-[id]-build.md                  # Handoff stories ready for automated execution
Inter-Skill File Handoff ProtocolSkills in Bionic AI operate statelessly and pass state across pipeline stages using filesystem persistence and relative path contracts:[User Context / Prompt]
         │
         ▼
┌─────────────────────────┐
│  /bmad-brainstorming/   │ ──(Dual-sync note.txt)───┐
└─────────────────────────┘                          │
         │                                           ▼
         │                             ┌─────────────────────────┐
         ├────────────────────────────>│  /bmad-project-context/ │
         │                             └─────────────────────────┘
         │                                           │ (Reads note.txt -> Generates plan.md & prd.md)
         │                                           ▼
         │                             ┌─────────────────────────┐
         │                             │   /bmad-architecture/   │
         │                             └─────────────────────────┘
         │                                           │ (Reads prd.md -> Generates plan.md, tech-spec.md, adrs)
         │                                           ▼
         │                             ┌─────────────────────────┐
         │                             │  /bmad-story-breakdown/ │
         │                             └─────────────────────────┘
         │                                           │ (Reads tech-spec.md -> Generates plan.md & story-[id].md)
         │                                           ▼
         └────────────────────────────>│    /bmad-build-auto/    │
                                       └─────────────────────────┘
                                         (Executes story-[id]-build.md inside venv, runs linter & pytest,
                                          generates coverage-report.md; on failure -> runs debugging-plan.md)
Path Contract GuidelinesUpstream Referencing: Every downstream document MUST explicitly list its upstream sources in YAML metadata or Markdown context headers:- **Upstream PRD**: /bmad-project-context/prd.md
- **Upstream Tech Spec**: /bmad-architecture/tech-spec.md
- **Upstream Local Plan**: /bmad-story-breakdown/plan.md
Quality Gate Validation: Before a downstream skill executes, Bionic evaluates the local AGENTS.md file to verify that all referenced upstream path contracts exist and are complete.Complete Markdown Artifact SpecificationBMAD uses specialized .md files to enforce complete coverage across spec development, static analysis, virtual environment execution, test coverage, and debugging:File NameLocationPrimary Functionnote.txtbmad-brainstorming, bmad-project-contextRaw, unaltered user prompt/transcript mirror.AGENTS.mdAll Stage DirectoriesMachine-readable constraints, quality gates, and agent behavior rules.README.mdAll Stage DirectoriesHuman navigation index and status summary for the directory.tasks.mdAll Stage Directories & RootAI task memory tracking current state, dynamic TODO lists, and completion markers.plan.mdAll Stage DirectoriesPlanning-first roadmap defining the sequence of operations prior to execution.prd.mdbmad-project-contextProduct specifications, domain models, feature boundaries, and user journeys.tech-spec.mdbmad-architectureArchitecture design, data schemas, API contracts, and technology stack directives.adr-[id].mdbmad-architectureArchitectural Decision Record documenting trade-offs and non-negotiable choices.story-[id].mdbmad-story-breakdownAtomic unit of work with Definition of Ready (DoR), DoD, and test specifications.venv-config.mdbmad-build-autoVirtual environment creation, interpreter path, dependencies, and environment variables.lint-spec.mdbmad-build-autoStatic analysis rules, AST constraints, style formatting directives, and linter commands.test-plan.mdbmad-build-autoTest matrices, mock strategies, unit/E2E test directives, and setup instructions.coverage-report.mdbmad-build-autoQuantitative coverage metrics (line, branch, statement) with target standard ($\ge 85\%$).story-[id]-build.mdbmad-build-autoExecutable build file binding code changes, lint checks, test executions, and venv commands.debugging-plan.mdbmad-build-autoRoot-cause analysis, reproduction scripts, stack trace triage, and verification plan for failed builds.Planning-First & Task Memory Mechanics1. Planning First (plan.md)Before writing code, generating specifications, or executing builds, Bionic must create or update a plan.md file in the targeted directory:Pre-Execution Check: Defines objectives, inputs, risks, dependencies, and expected outputs.Traceability: All output files generated in that directory must reference plan.md.2. Dynamic AI Task Memory (tasks.md)Bionic uses tasks.md as its persistent task memory to track multi-turn progress and prevent state loss:# Local Task Memory: {directory_name}

## Task Queue
- [x] Task 1: Initialize stage scaffolding and inspect upstream path contracts <!-- completed: 2026-09-18 -->
- [/] Task 2: Generate preliminary plan.md and validate against local AGENTS.md <!-- in-progress -->
- [ ] Task 3: Produce downstream spec artifacts
- [ ] Task 4: Execute quality gate verification

## Execution State & Context Memory
- **Active Context**: Processing story-001 handoff.
- **Dependencies Met**: `/bmad-architecture/tech-spec.md` validated.
- **Next Action**: Execute pytest inside `.venv` and output `coverage-report.md`.
Python Virtual Environment (venv) ProtocolAll automated build, lint, test, and debugging tasks within /bmad-build-auto execute within an isolated Python Virtual Environment (venv):Environment Initialization:Inspect or create the .venv directory at the project root.Path contract: .venv/bin/activate (POSIX) or .venv\Scripts\activate (Windows).Configuration Persistence (/bmad-build-auto/venv-config.md):Documents python interpreter version, pip dependencies, requirements.txt path, and environment variables.Execution Command Standard:# Source venv and execute linting and tests
source .venv/bin/activate
ruff check .
pytest --cov=src --cov-report=term-missing --cov-report=markdown > bmad-build-auto/coverage-report.md
Automated Debugging Workflow (debugging-plan.md)When a build step, lint check, or test suite fails during automated execution in /bmad-build-auto, Bionic immediately halts standard progression and switches to the Debugging & Triage Pipeline:Triage Trigger: Triggered when linter exit code $\ne 0$, test suite fails, or test coverage falls below the mandatory threshold ($\le 85\%$).Artifact Generation: Bionic generates or updates /bmad-build-auto/debugging-plan.md.Structure of debugging-plan.md:Failure Summary: Captured console error, stack trace, or coverage gap.Root Cause Hypotheses: Evaluated hypotheses ranked by probability.Reproduction Steps: Exact commands executed inside .venv to isolate the bug.Fix Strategy: Targeted file edits and code modifications.Verification Criteria: Specific command output needed to mark the issue resolved.Resolution Loop:Bionic executes the fix strategy inside .venv.Re-runs linter and test suite.Updates tasks.md and marks debugging-plan.md as resolved upon passing all quality gates.Directory Scaffolding TemplatesWhenever Bionic creates or accesses a workspace stage folder, it ensures standard scaffolding files exist:AGENTS.md Template# Agent Directives: {directory_name}

## Operational Scope
- Operations restricted to `/{directory_name}` and declared downstream dependencies.

## Inputs & Dependencies
- Validate presence of upstream stage artifacts and local `plan.md` before executing modifications.

## Quality Gates & Verification
- All `.md` documents must contain valid YAML metadata headers.
- Enforce strict linting rules (`lint-spec.md`) and test coverage standards ($\ge 85\%$) prior to handoff.
README.md Template# Directory: {directory_name}

## Purpose
{brief description of stage role in the BMAD pipeline}

## Managed Artifacts
| File Name | Purpose | Status |
| :--- | :--- | :--- |
| `plan.md` | Stage execution plan | Active |
| `tasks.md` | AI task memory and TODO state | Active |

## Pipeline Handoff Status
- **Upstream Source**: {upstream_directory}
- **Downstream Target**: {downstream_directory}



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
