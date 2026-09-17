# Architecture Document

## 1. System Overview
A CLI application providing standardized and custom hello-world outputs while maintaining verified test coverage >= 30%.

## 2. Component Structure

### Core Components
- **`src/main.py`**: Main entry point with greeting functions
- **`src/utils/`**: Utility module for future extensibility

### Test Structure
- **`tests/unit/test_main.py`**: Unit tests for core functions
- **`tests/integration/`**: Integration test suite (placeholder)

## 3. Entry Point Flow
```
python -m src.main [target_name?]
│
├─ No arguments → Print standard greeting
└─ Has argument  → Print personalized greeting
```

## 4. Test Coverage Requirements
- Minimum branch/statement coverage: **30%**
- Verified via `pytest --cov=src`
- Configured in `.coveragerc` and `pyproject.toml`

## 5. Code Quality Gates
- **Linting**: `ruff check src tests` (no errors)
- **Type Checking**: `mypy src` (strict mode, no missing imports warning)
- **Test Coverage**: >= 30% (branch and statement coverage enabled)