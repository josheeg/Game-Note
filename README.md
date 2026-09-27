# breakout

A retro-themed Breakout game in Godot 4.7.2 with GDScript.

Brick wall, paddle, ball. Two levels, loaded from a CSV. Power-ups drop from marked bricks. The
look is arcade-era:
a constrained six-colour palette, 320×240 at an integer 2× scale, nearest-neighbour filtering,
black background. No menus, no power-ups, no audio yet.

## Quick start

Nothing needs installing. Godot 4.7.2 and the test framework are vendored in this repo.

**First run on a fresh clone** — the generated `.godot/` cache is not committed, so import once:

```powershell
.\Godot_v4.7.2-stable_win64_console.exe --headless --path . --import
```

**Play it:**

```powershell
.\Godot_v4.7.2-stable_win64.exe --path .
```

That runs the game directly. The default for `--path` is to run the scene; `--editor` is the flag
that forces the editor instead. A debug run's window is titled `breakout (DEBUG)` — that is the
game, not the editor.

**Open the editor** (to edit scenes, read the inspector, or use the debugger):

```powershell
.\Godot_v4.7.2-stable_win64.exe --path . --editor
```

## Controls

| Key | |
|---|---|
| **← / →** | Move the paddle |
| **1** / **2** | Jump straight to that level |
| **R** | Restart the current level |

Clear a level and it advances after a short pause, wrapping at the last one.

If the arrows do nothing, click inside the game window once — Godot routes input to the
focused viewport.

## Tests

Gameplay logic is node-free and unit-tested; scene wiring is not, and is verified by playing.

```powershell
addons\gdUnit4\runtest.cmd --godot_binary .\Godot_v4.7.2-stable_win64_console.exe -a res://test
```

Suites covering wall reflection, the paddle anti-stall clamp, brick damage and
indestructibility, level parsing and placement, the drop schedule, the catch
geometry, and the level-end transitions. Run with `-c` to disable fail-fast — by
default one failure hides every case after it.

**Check the output, not just the exit code.** The runner exits **0** when no test ran at all —
whether `-a` is missing or points at an empty directory — printing `No test cases found` and
still reporting success. A real pass needs a `Statistics:` line with a non-zero case count and
zero errors. Exit **100** means assertion failures, **105** a script error during discovery.

## Layout

```
project.godot            main scene entry, 320x240, nearest filter
scenes/main.tscn         the whole vertical slice
scripts/                 game code
  ball_math.gd           reflection + the anti-stall clamp (pure)
  game_state.gd          lives, score, level-end transitions (pure)
  level_data.gd          ASCII rows -> flat brick array (pure)
  brick.gd               one brick type, integer hp — no subclasses
  main.gd                rules owner; resolves all collision
  paddle.gd ball.gd brickfield.gd hud.gd
levels/levels.csv          one row per level-row: level,row,layout
test/                    GdUnit4 suites
```

A level is data. `levels/levels.csv` holds one row per level-row, and each cell is a letter:

| | |
|---|---|
| `.` | empty |
| `#` | plain brick |
| `P` | drops a power-up that widens the paddle |
| `B` | drops a power-up that grants a life |
| `S` | drops a power-up that slows the ball |
| `X` | indestructible, takes no damage |

`LevelData.parse` turns those rows into a flat array of bricks and `LevelData.place` assigns
each one a rectangle. Letters rather than digits so the grid states what each cell is without a
legend lookup. Adding a level means adding rows; no code changes. Row width is validated at
parse time, so a ragged layout is a loud error rather than a silently sheared wall.

Godot's CSV importer also reads this file as a translation table and generates `.import` and
`.translation` files beside it. They are gitignored and unused — the CSV is read as plain text.

## Design decisions worth knowing

- **The palette is a contract.** `.specify/frame-contract.md` holds the values: resolution, tile
  size, grid, and the six arcade colours. They also live in `scripts/brickfield.gd` and
  `icon.svg`, so a palette change must touch all three in one commit.
- **The 20° paddle clamp is load-bearing.** Below roughly 20° off vertical the ball returns to
  the paddle on the same trajectory and the round cannot end. It is what prevents corner camping,
  and it is pinned by a test.
- **Collision is manual AABB, not physics bodies.** Deliberate: deterministic, testable without a
  scene tree, and verifiable from a headless shell.
- **One brick type, no polymorphism.** `Brick` is an integer hp and nothing else, because no
  second brick behaviour has earned one yet.

## Governance

`.specify/memory/constitution.md` is binding and wins over everything else. Read it before
planning or changing anything. It requires a failing test before implementation and verification
by execution rather than by reading a diff.
