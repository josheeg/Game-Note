# TODO

Short working list. Not a substitute for the Spec Kit pipeline — work that needs
a spec, a plan, or a task breakdown belongs in a Spec Kit feature
(`/speckit.specify`), which owns planning. This file is for the next few things,
in order.

## Done, for context

The power-up chain is complete and tested: drop schedule, spawn, fall, catch, miss,
and the three effects. Bricks carrying a power-up render near-white so they are
visible against the row palette. The catch is verified through the real loop, with
a tracking paddle, not only by calling the dispatch directly.

Per-level `ball_speed` is restored: stated on a level's first row and inherited by
the rest. Level 1 serves at 180, level 2 at 200.

`X` earned its place, but not the way it was assumed. It was not a dead feature —
it was a landmine. See below.

## Now: nothing — the tuning block is closed

Every tunable in `scripts/power_rules.gd` has been played and kept. No constant is
marked `PROVISIONAL` any more:

- [x] `BALL_SPEED_SLOWED` (120) — played, kept.
- [x] `PADDLE_HALF_WIDTH_WIDENED` (36) and `WIDEN_SECONDS` (6) — played, kept.
- [x] Catching `P` while already wide **refreshes** the 6s timer rather than being
      wasted. The paddle cannot grow twice (`widened()` is a max, not a sum, and is
      tested), so time is the only thing a second `P` can give. Setting the timer
      unconditionally was already the behaviour; it is now documented, because at a
      high drop rate it is the difference between a capsule that rewards and one
      that does nothing.
- [ ] Whether a missed power-up can be replaced. Still open, and now the only tuning
      question left. If missing one is pure loss, `EVERY_N` is punishing in a way
      that needs measuring.
- [x] `EVERY_N` (12) — **answered: farmable, so it stays at 12.** Played at 1, 3 and
      12. At 3 (about 32 drops per level, falling at half ball speed) parking under a
      band and waiting **felt like the correct strategy** — so a high drop rate makes
      farming dominant, and the proposed `EVERY_N = 4` would have been too generous.
      Kept at 12. Rarity is what stops the game becoming a parking exercise, and one
      drop per level is the price of that.
      Two attempts to answer this headlessly both failed, for reasons worth recording:
      a pinned paddle loses the ball in seconds, so it measures a bad player rather
      than a farmer, and it needs a paddle policy competent enough to track drops.
      Level 1 has 16 power bricks, so 12 yields exactly one drop per playthrough, at
      the 12th — which is the intended rarity, not a bug.
- [x] Drop fall speed — **answered: half the ball speed** (0.5, ~2.1s from row 2).
      Tried 1.0, then 0.75, then 0.5. Accepted cost: a capsule hangs in the ball's
      path long enough to be struck twice.

## Then

- [ ] More levels. Pure data entry, and it keeps the CSV format honest.

## Undesigned, deliberately

- [ ] **Catch** — the ball attaches to the paddle and is re-aimed on release. Adds
      a state the core loop does not have.
- [ ] **Multiball** — the largest difficulty swing in the genre. **Ruled: two balls
      dying on the same frame costs two lives.** Recorded before any design, so the
      design is built against the ruling rather than discovering it later. What is
      left is the rest of the design: how a second ball spawns, whether the drop
      schedule counts bricks once regardless of how many balls are in play, and how
      the level ends when the last ball is gone.
- [ ] **Break** — clears bricks on screen. Needs a screen-wide query.
- [ ] **Reverse** — flips ball direction. Trivial, but a scoring hazard.

## Open questions

- [x] **Should a level actually use `X`? Yes — level 2 now has them.** Four
      indestructible cells at the inner corners of the pocket, so the ball has to
      be worked around them rather than clearing every cell. That is the point of
      the mechanic: it changes level *shape*. Costs no extra code now that the win
      condition excludes indestructible bricks, and it gives the format letter a
      real caller, which is what Principle V asks for. The reverse question is
      therefore settled too — nothing gets deleted, because something uses it.
      Verified: 60 bricks placed, 4 indestructible, 56 destroyable; a pillar
      survives five hits unchanged; clearing all 56 wins the level with the 4
      pillars standing.
- [ ] **Audio.** Zero audio exists — no paddle tick, wall tick, or brick break. The
      constitution's retro identity clause is the largest thing promised and not
      built, and the three-sound triad is the cheapest high-value item on that list.

## Known gap, accepted for now

- [ ] Scene wiring has no automated coverage. 42 cases cover game logic; `main.tscn`
      and the node graph are verified only by playing. Either close it or record it
      as accepted. Probes have filled part of this by hand — the power-up chain and
      the `X` win condition were both verified through the instantiated scene — but
      that is per-feature and does not survive a change to the node graph.
