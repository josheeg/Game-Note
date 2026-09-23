# Test Framework Scaffold Complete

## Engine Detected: Godot
## Framework: GUT (Godot Unit Test)

### Rationale: GUT is the Godot Unit Test framework — the standard and recommended testing framework for Godot 4.x. It integrates natively with Godot's scene system, supports both unit and integration tests, and provides a CLI runner for headless CI execution. No external dependencies beyond the Godot engine binary.

### Directory Structure

```
test-godot-game/
├── project/
│   ├── project.godot
│   ├── scenes/
│   │   ├── main_scene.tscn
│   │   └── ...
│   ├── scripts/
│   │   ├── player.gd
│   │   ├── audio_manager.gd
│   │   └── ...
│   └── addons/
│       └── gut/
│           ├── gut.gd (plugin main)
│           ├── gut_cmdln.gd (CLI entry point)
│           └── gut_test.gd (base test class)
├── tests/
│   ├── unit/
│   │   ├── test_player_movement.gd
│   │   ├── test_listen_mechanic.gd
│   │   ├── test_plant_seed.gd
│   │   └── test_seed_gates.gd
│   ├── integration/
│   │   ├── test_core_loop.gd
│   │   └── test_biome_transitions.gd
│   └── gut_config.json
└── gut_config.json
```

### GUT Configuration (`gut_config.json`)

```json
{
  "dirs": ["res://tests/"],
  "include_subdirs": true,
  "prefix": "test_",
  "suffix": ".gd",
  "should_exit": true,
  "should_exit_on_success": true,
  "log_level": 1,
  "junit_xml_file": "results.xml"
}
```

**Configuration notes:**
- `dirs`: Points to the test root directory `res://tests/`
- `include_subdirs`: Recursively discovers test files in subdirectories (`unit/`, `integration/`)
- `prefix`: `test_` — all test files must start with this prefix
- `suffix`: `.gd` — Godot script files
- `should_exit`: Test runner exits after all tests complete (CI-friendly)
- `should_exit_on_success`: Test runner exits with code 0 if all tests pass
- `log_level`: 1 = errors only; increase to 2 (warnings) or 3 (info) for debugging

### How Godot 4.x Nodes/Scenes Get Unit-Tested

GUT extends Godot's `TestCase` class (via `GutTest`). Each test file extends `GutTest` and defines `before_each()`, `after_each()`, and individual test functions using `func test_name()`.

**Testable Godot systems:**

1. **Node components** — `Area2D`, `CharacterBody2D`, `AudioPlayer`, etc. — tested in isolation with `before_each()` instantiating the node via `get_tree().root.add_child(node_class.new())`

2. **Scene components** — whole scenes loaded via `load()` and added to the scene tree; tests verify node relationships, signal emissions, and state changes

3. **Audio systems** — voice budget, layer mixing, procedural generation — mocked audio server where possible; GUT runs in the Godot headless environment so audio test events are detectable via `AudioServer.get_busy_voice_count()` etc.

4. **Signal-based systems** — tests connect/disconnect signals and verify emission patterns; `before_each()` typically clears signal connections to avoid cross-test contamination

5. **Player movement** — `CharacterBody2D` processing, acceleration/deceleration, Listen mechanic activation

6. **Plant growth** — seed planting, growth timeline (8s), terrain shape changes, audio voice addition

7. **Seed gates** — gate 1 (1 seed in Oak Grove), gate 2 (2 seeds in Stream Crossing), gate 2 (2 seeds in Pine Ridge) — verify required fragment counts trigger terrain changes

8. **Fragment economy** — melody fragment collection limits (8-12 total, 5 required + 4-6 optional), verification that required fragments gate progress

9. **Audio voice budget** — ≤ 16 simultaneous voices; test verifies voice counting under maximum concurrent conditions (wind bed + grass rhythm + creatures + planted melodies)

10. **6 biome transitions** — test that score density and voice layers shift correctly at each biome boundary (Meadow → Oak Grove → Stream Crossing → Pine Ridge → The Clearing → The Hill)

11. **No-fail-state invariants** — verify no test produces a "game over" or failure state; all tests are progressive/state-reporting only

### Coverage Targets Aligned to GDD Mechanics

| Mechanic | Minimum Coverage | Rationale |
|----------|-----------------|-----------|
| Movement (walk/run) | 80% | Foundational verb; must work reliably every frame |
| Listen (directional focus, 45° cone, 1.5s amplify) | 90% | Core discovery tool; every edge case (cone boundary, cooldown, amplify) tested |
| Plant song-seed | 85% | Permanent world-shaping; growth timeline, audio voice addition, gate triggering |
| Seed gates 1/2/2 | 100% | Grove (1 seed), Stream (2 seeds), Pine Ridge (2 seeds) — gates are the primary progression; must work deterministically |
| Fragment economy (8-12 total, 5 required + 4-6 optional) | 90% | Verifies required vs. optional fragment counting; gate triggering logic |
| Audio voice budget (≤ 16 simultaneous voices) | 100% | Critical performance and correctness constraint; must never exceed 16 |
| 6 biome transitions | 100% | Each biome boundary (Meadow→Oak Grove, Oak Grove→Stream, Stream→Pine Ridge, Pine Ridge→Clearing, Clearing→Hill, plus final handoff) tested |
| No-fail-state invariants | 100% | All invariants verified — no test should produce a failure/ Game Over state |

**Overall coverage target: ≥ 85%** across all test categories, with the critical invariants (audio voice budget, seed gates, no-fail-state) at 100%.

### CI-Ready Headless Test Command

```bash
# From the project root (where project.godot resides)
godot --headless --path . -s addons/gut/gut_cmdln.gd -- tests/
```

**Alternative (using pytest-style GUT runner):**

```bash
godot --headless --path . -e "run_tests(tests/unit)" -s addons/gut/gut_cmdln.gd
```

**CI integration (GitHub Actions example):**

```yaml
name: Godot GUT CI

on: [push, pull_request]

jobs:
  test:
    runs-on: windows-latest
    steps:
      - uses: actions/checkout@v4
      - name: Install Godot
        uses: eccentricdev/install-godot@v2
        with:
          version: "4.2-stable"
      - name: Run GUT tests
        run: |
          godot --headless --path . -s addons/gut/gut_cmdln.gd -- tests/
      - name: Upload coverage
        if: always()
        uses: actions/upload-artifact@v4
        with:
          name: gut-results
          path: results.xml
```

### Verification Steps

1. **GUT plugin presence**: `addons/gut/` directory exists with `gut.gd`, `gut_cmdln.gd`, and `gut_test.gd`
2. **Configuration file**: `tests/gut_config.json` exists with correct `dirs`, `prefix`, `suffix` settings
3. **Test file discovery**: `gut_cmdln.gd` correctly discovers `tests/unit/` and `tests/integration/` subdirectories
4. **Sample test runs**: A minimal test (e.g., `test_player_movement.gd` extending `GutTest`) executes without errors
5. **JUnit XML output**: `results.xml` is generated after test run; CI can parse pass/fail counts
6. **Exit code 0 on success**: Test runner exits with code 0 when all tests pass; non-zero on failures
7. **Headless mode**: Tests run successfully with `--headless` flag (no GUI required)
8. **CLI argument format**: `-- path/to/tests` format accepted; `-- tests/` resolves test directory

### Next Steps (after project scaffold exists)

1. Install GUT addon: download Godot Unit Test plugin into `addons/gut/`
2. Create `tests/gut_config.json` with the configuration above
3. Write initial test suite covering: movement, Listen, first planting, seed gate 1 (Grove)
4. Run `godot --headless --path . -s addons/gut/gut_cmdln.gd -- tests/` to verify
5. Expand coverage to all 6 biomes, audio voice budget, and gate invariants
6. Integrate CI pipeline with the headless command