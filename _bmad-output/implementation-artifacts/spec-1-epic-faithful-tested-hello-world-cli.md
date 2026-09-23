---
title: 'Epic 1: faithful, tested hello-world CLI'
type: 'feature'
created: '2026-09-22'
status: 'in-progress' # draft | ready-for-dev | in-progress | in-review | done | blocked
review_loop_iteration: 0 # incremented by step-04 before each review loopback
baseline_revision: NO_VCS # current HEAD captured by step-03; NO_VCS when version control is unavailable
followup_review_recommended: false # set by step-04 on status: done — true if the LLM decided another review pass is worthwhile
context: [] # optional: `{project-root}/`-prefixed paths to project-wide standards/docs the implementation agent should load. Keep short — only what isn't already distilled into the spec body.
warnings: [oversized] # optional: machine-readable warnings for orchestration, e.g. oversized, multiple-goals
deferred: [] # append-only machine-readable deferred review findings; each item carries summary/evidence and optional location/severity
---

<intent-contract>

## Intent

**Problem:** The scaffold `main.py` does not yet satisfy the forged contract: it lacks a pure `hello()` core, a `--version` flag, deterministic `prog="main.py"` output, the exit-0/2 stream contract, and the empty/whitespace `--name` → `World` fallback. Tests do not exist.

**Approach:** Rebuild `main.py` as a ~30-line functional-core/imperative-shell CLI per AD-1..AD-5, add pytest as a dev dependency, and write a capsys-based `tests/test_main.py` covering every contract capability and edge case without subprocess invocations.

## Boundaries & Constraints

**Always:**
- Pure `hello(name: str) -> str` returns exactly `f"Hello, {name.strip() or 'World'}!"`; performs no I/O.
- `main(argv: list[str] | None = None) -> int` is the sole I/O boundary (argparse + print).
- stdlib `argparse` only; `ArgumentParser(prog="main.py", ...)` for deterministic version/usage text.
- Module-level `__version__` constant is the only version source; wired via `action="version"` with version string `0.1.0` (so output is `main.py 0.1.0`), taking precedence over `--name` (argparse inherent behavior).
- Exit 0 on success (data to stdout only); exit 2 via argparse `SystemExit` on bad args (usage/errors to stderr only); help exits 0 with usage on stdout.
- Deterministic ASCII output; no color, ANSI, Unicode, network, or file writes; no runtime deps beyond stdlib.
- Type hints on every function signature; `__version__` as a module-level constant; ruff defaults (line length 88, imports stdlib/third-party/local).
- Tests: `tests/test_main.py`, capsys for I/O capture, `pytest.raises(SystemExit)` for error paths — never subprocess.
- `scaffold.py`'s embedded `main.py` template must be updated to match the new implementation so regeneration stays consistent.

**Never:**
- No manual `sys.argv` scanning; no `src/` layout; do not remove `[tool.uv] package = false`.
- No subprocess invocation in tests; no `importlib.metadata` version lookup.
- No tracebacks printed to the user; no interactive prompts/stdin reads.
- No changes to README.md / AGENTS.md / pyproject version or metadata (except the dev-dependency addition).

## I/O & Edge-Case Matrix

| Scenario | Input / State | Expected Output / Behavior | Error Handling |
|----------|--------------|---------------------------|----------------|
| Bare run (CAP-1) | `main.py` | stdout `Hello, World!`, exit 0 | None expected |
| Custom name (CAP-2) | `main.py --name Ada` | stdout `Hello, Ada!`, exit 0 | None expected |
| Empty name | `main.py --name ""` | stdout `Hello, World!`, exit 0 | None expected |
| Whitespace name | `main.py --name "   "` | stdout `Hello, World!`, exit 0 | None expected |
| Trimmed name | `main.py --name " Ada "` | stdout `Hello, Ada!`, exit 0 | None expected |
| Last-one-wins | `main.py --name Ada --name Belle` | stdout `Hello, Belle!`, exit 0 | None expected |
| Version (CAP-3) | `main.py --version` | stdout `main.py 0.1.0`, exit 0 | None expected |
| Version precedence | `main.py --version --name Ada` | stdout `main.py 0.1.0`, exit 0 | None expected |
| Unknown flag (CAP-4) | `main.py --bogus` | stderr argparse usage + `error: unrecognized arguments`, exit 2 | argparse SystemExit |
| Missing value (CAP-4) | `main.py --name` | stderr argparse usage + error message, exit 2 | argparse SystemExit |
| Help (CAP-4) | `main.py -h` / `main.py --help` | usage + options on stdout, exit 0 | None expected |

</intent-contract>

## Code Map

- `main.py` -- ONLY production module (AD-1). Currently a stale 18-line scaffold: `main()` takes no args, `hello()` absent, no `prog`, no `__version__`, no version flag. Full rewrite target (~30 lines).
- `scaffold.py` -- Regenerator; `FILES["main.py"]` embeds the old template. Must be updated in sync so `uv run python scaffold.py` does not overwrite the new build. `ROOT` + `FILES` dict at module level; `pytest` needs no scaffold change.
- `pyproject.toml` -- Flat layout, `[tool.uv] package = false`, version `0.1.0`. Dev-deps currently empty; must gain `pytest` via `uv add --dev pytest` (do NOT hand-edit; let uv manage `uv.lock`).
- `_bmad-output/implementation-artifacts/epic-1-context.md` -- Compiled epic context (contract distilled; read for AD/CAP references).
- `tests/test_main.py` -- New file; does not exist yet. Capsys-based contract tests.

## Tasks & Acceptance

**Execution:**
- `uv add --dev pytest` -- add pytest dev-dependency (updates pyproject.toml + uv.lock) -- required before tests can run under `uv run pytest`.
- `main.py` -- rewrite as functional-core/imperative-shell CLI per AD-1..AD-5: module docstring; `__version__ = "0.1.0"`; `hello(name: str) -> str` with exact canonicalization; `main(argv: list[str] | None = None) -> int` constructing `ArgumentParser(prog="main.py", description=...)`, `--name` (default `"World"`, help text), `--version` (`action="version"`, `version="0.1.0"` — NOT `%(prog)s` template, since prog is already fixed), `print(hello(...))`, `return 0`; `if __name__ == "__main__": raise SystemExit(main())` -- replace stale scaffold and meet every contract capability.
- `scaffold.py` -- replace embedded `FILES["main.py"]` template with the new implementation verbatim -- keeps regeneration consistent and prevents scaffold overwrite regression.
- `tests/test_main.py` -- new file, one test per I/O Matrix row + pure-function unit tests + bare/version/help/error exit codes via capsys + `pytest.raises(SystemExit)` -- prove the contract and keep coverage surface-anchored (assert on stdout/stderr text and exit codes, never internal calls).
- I/O edge-case coverage -- ensure the matrix rows (empty, whitespace, trim, last-one-wins, version precedence) each have a test -- the matrix is the contract's exhaustive input surface.

**Acceptance Criteria:**
- Given the rebuilt `main.py`, when I run `uv run python main.py`, then stdout is exactly `Hello, World!`, stderr is empty, and the exit code is 0.
- Given `--name Ada`, when I run the CLI, then stdout is exactly `Hello, Ada!` with exit code 0.
- Given `--name ""` or `--name "   "`, when I run the CLI, then stdout is exactly `Hello, World!` (fallback) with exit code 0.
- Given `--name " Ada "`, when I run the CLI, then the greeting uses the stripped name (`Hello, Ada!`).
- Given `--name Ada --name Belle`, when I run the CLI, then the last value wins (`Hello, Belle!`).
- Given `--version` (with or without `--name`), when I run the CLI, then stdout is exactly `main.py 0.1.0` with exit code 0.
- Given an unknown flag or a missing `--name` value, when I run the CLI, then stderr carries the argparse usage/error and the exit code is 2, with no traceback.
- Given `-h` or `--help`, when I run the CLI, then usage text appears on stdout and the exit code is 0.
- Given the source, when I read `main.py`, then it is ~30 lines, uses only stdlib, and every function has type hints.
- Given `uv run python scaffold.py` after the build, then `main.py` is unchanged by regeneration.

## Spec Change Log

<!-- Append-only. Populated by step-04 during review loops. Do not modify or delete existing entries.
     Each entry records: what finding triggered the change, what was amended, what known-bad state
     the amendment avoids, and any KEEP instructions (what worked well and must survive re-derivation).
     Empty until the first bad_spec loopback. -->

## Review Triage Log

<!-- Append-only. Populated by step-04 on EVERY review pass, including loopbacks and blocked exits.
     Each entry records verdict counts (high/medium/low/false/maybe-false) and one row per
     reviewer finding: verdict, route, and evidence — the refutation for false, what would settle
     it for maybe-false, the action taken for patches. Empty until the first review pass. -->

## Design Notes

Non-obvious points preserved so the implementer does not re-derive them:

- **Version output shape**: argparse `action="version"` prints the version string as given (with the `%(prog)s` prefix only if the version string contains it). Because AD-3 fixes `prog="main.py"` directly, passing `version="0.1.0"` yields exactly `main.py 0.1.0` — no `%(prog)s` template needed and no `sys.argv[0]` leakage.
- **`prog="main.py"` rationale**: under pytest capsys, `sys.argv[0]` is the pytest runner, so without `prog` the version/usage text would print the wrong program name. Fixing `prog` makes output deterministic across CLI and test contexts (adversarial-review finding F2).
- **`raise SystemExit(main())`**: makes `main()` return-value-aware and is what pytest's `SystemExit` capture relies on; `pytest.raises(SystemExit)` checks the exit code via `exc_info.value.code`.
- **Canonicalization**: `f"Hello, {name.strip() or 'World'}!"` — strip first, then fallback. `"" or "World"` and `"   ".strip() or "World"` both yield `World`; `" Ada "` strips to `Ada`.
- **Golden example (main.py skeleton)**:
  ```python
  __version__ = "0.1.0"

  def hello(name: str) -> str:
      return f"Hello, {name.strip() or 'World'}!"

  def main(argv: list[str] | None = None) -> int:
      parser = argparse.ArgumentParser(prog="main.py", ...)
      parser.add_argument("--name", default="World", ...)
      parser.add_argument("--version", action="version", version=__version__)
      args = parser.parse_args(argv)
      print(hello(args.name))
      return 0

  if __name__ == "__main__":
      raise SystemExit(main())
  ```

## Verification

**Commands:**
- `uv run pytest` -- expected: all tests pass, no failures/errors.
- `uv run ruff check .` -- expected: no lint findings.
- `uv run python main.py` -- expected: stdout `Hello, World!`, exit 0.
- `uv run python main.py --version` -- expected: stdout `main.py 0.1.0`, exit 0.
- `uv run python main.py --name ""` -- expected: stdout `Hello, World!`, exit 0.
- `uv run python scaffold.py` then `uv run python main.py` -- expected: regeneration does not change behavior.

**Manual checks (if no CLI):**
- Read `main.py`: ~30 lines, stdlib-only imports, type hints on every signature with no `Any`-style suppression.