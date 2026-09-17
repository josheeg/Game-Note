# Product Requirements Document (PRD)

## 1. Overview
A CLI application providing standardized and custom hello-world outputs while maintaining verified test coverage >= 30%.

## 2. Functional Requirements
- **FR-1 (Request 1):** Default execution prints `"Hello, World!"`.
- **FR-2 (Request 2):** Parameterized execution prints `"Hello, <Name>!"`.

## 3. Non-Functional Requirements
- **NFR-1:** Unit test suite must achieve at least 30% branch/statement coverage verified via `pytest-cov`.
- **NFR-2:** Code must pass all linting checks (`ruff check`).
- **NFR-3:** Type annotations required for all functions (`mypy strict`).

## 4. Acceptance Criteria
1. Standard greeting works without arguments
2. Custom greeting accepts and validates single name argument
3. All tests pass with >= 30% coverage
4. No linting or type check errors