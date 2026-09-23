# Contributing Guidelines

Thank you for your interest in contributing!

## Code Style

- Follow PEP 8 guidelines
- Line length: 88 characters (enforced by ruff)
- Type hints are required (enforced by mypy strict mode)

## Testing Requirements

- All changes must pass existing tests
- Maintain >= 30% test coverage threshold
- Add tests for new features before implementation

## Pull Request Checklist

- [ ] Code passes linting (`ruff check src tests`)
- [ ] Type checks pass (`mypy src`)
- [ ] Tests pass with coverage gate (`pytest`)
- [ ] Documentation updated as needed
- [ ] Commit messages follow conventional commits format

## Development Workflow

1. Create a new branch from `main`
2. Make your changes
3. Add/modify tests as needed
4. Ensure all CI checks pass locally
5. Submit pull request for review