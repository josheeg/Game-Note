# Development Epics — The Living Walk

**Source:** `gdd.md` (v0.1, 2026-09-22)
**Granularity:** one-screen epics with high-level story breakdowns; story files created later by `gds-create-story`.

---

## E1 — Audio Engine Prototype

**Goal:** Prove the living-score concept stands alone. Gate for all content work.

**Scope:**
- Standalone Godot scene: a walkable strip of "meadow" with no art
- Generative score: wind bed + footstep-pattern rhythm + 2 creature voices + 2 plantable melodic voices
- Scale-system selector (pentatonic / folk-modal) for tone lock
- External-listener musicality test (designer plays it for 3 non-project people)

**Stories:**
- S1.1: AudioStreamGenerator voice pool (bounded ≤ 16 voices, configurable)
- S1.2: Wind-bed synth layer (biome base texture)
- S1.3: Footstep-pattern rhythm layer (movement → tempo/texture mapping)
- S1.4: Two creature counter-melody voices (scripted swells)
- S1.5: Two melodic seed voices with persistent layering
- S1.6: Scale system selector + musicality test harness

**Acceptance:** external listeners describe the output as "music," not "noise"; 60 fps with audio running.

---

## E2 — Core Movement + SVG Rendering (Meadow)

**Goal:** Playable walk with a real meadow biome; establishes the SVG pipeline and Listen tool.

**Scope:**
- SVG import pipeline into Godot 4 2D (biome sets as layered scenes)
- 8-direction walk with acceleration profile (12/18 tiles/s²) and gamepad support
- Listen mechanic (hold-to-attend, 45° cone, 1.5s amplify, 2s+ hint swell)
- The Meadow: 2 voice layers, first Locate puzzle (hidden fragment), tutorial cueing (no text — audio first-contact teaching)

**Stories:**
- S2.1: SVG-to-Godot scene/tooling pipeline (test with 2-3 prototype shapes)
- S2.2: Player controller (walk, run timbre shift, collision)
- S2.3: Listen mechanic + directional sound amplification
- S2.4: Meadow biome scene (2 voice layers, parallax, palette)
- S2.5: First Locate puzzle + tutorial-by-contact

**Acceptance:** player can walk and listen in the meadow; find the hidden fragment by ear alone; 60 fps.

---

## E3 — Audio Puzzles

**Goal:** All three puzzle types implemented and balanced.

**Scope:**
- Locate (triangulate by pan/volume) — Meadow prototype becomes the standard
- Sequence (2→3 sources, musical-order resolution)
- Awaken (plant a compatible seed near a silent source)
- Hint swell (hold Listen 2s+ gently swells target motif + direction pulse)
- Difficulty ramp tuning (attention-based, no time pressure)

**Stories:**
- S3.1: Locate puzzle system (generic, reusable)
- S3.2: Sequence puzzle system (2 sources, then 3-source variant)
- S3.3: Awaken puzzle system (fragment-compatibility matching)
- S3.4: Hint/support system (swell + direction pulse)
- S3.5: 5 required + 4-6 optional puzzle placements across biomes

**Acceptance:** all 9-11 puzzles solvable by ear; < 2 min average find-time per placed POI.

---

## E4 — Song-Seed + Terrain Shaping

**Goal:** The world-shaping loop is complete and persistent within a session.

**Scope:**
- Plant song-seed on soil-ring: 8s root/grow animation + audible voice join
- Awakened-voices ledger (session state)
- Terrain gates: growth bridges, bloom gates, parting thickets (1/2/2 seed economy)
- Gate-opening resolving chord + visual bloom

**Stories:**
- S4.1: Soil-ring placement mechanics + seed growth timeline
- S4.2: Awakened-voices ledger (session persistence)
- S4.3: Growth-bridge gate (stream biome)
- S4.4: Bloom gate + parting thicket (grove/pine biomes)
- S4.5: Gate economy balance (required-fragment counts)

**Acceptance:** planting a seed is audibly and visually permanent; gates open only via planted seeds; session restart resets cleanly.

---

## E5 — Full Trail + Finale

**Goal:** Complete 20-40 min walk, biomes 2-6, and the hilltop reprise.

**Scope:**
- Oak Grove (Sequence 2), Stream Crossing (Awaken + bridge), Pine Ridge (Sequence 3, densest), The Clearing (atmosphere beat), The Hill (hush + finale)
- Story-echoes: 2-3 one-time sonic vignettes (optional side-pockets)
- Hilltop finale: full journey replayed as one accumulating song → silence → single closing note
- Arc beat-gates: sparse → waking → dense → hush → finale

**Stories:**
- S5.1: Oak Grove biome (Sequence-2 placement)
- S5.2: Stream Crossing biome (Awaken + bridge gate)
- S5.3: Pine Ridge biome (Sequence-3, densest score)
- S5.4: The Clearing biome (echoes, quiet beat)
- S5.5: The Hill + hush transition
- S5.6: Hilltop finale sequence (journey reprise player)
- S5.7: Arc beat-state manager (score density by position)
- S5.8: 2-3 story-echo sonic vignettes

**Acceptance:** full walk playable start→finale; ≥ 75% of demo players reach payoff; subjective "moved" response ≥ 60%.

---

## E6 — Accessibility + Polish

**Goal:** Ship-ready accessibility and performance.

**Scope:**
- On-screen audio visualizer (assist toggle)
- Colorblind-safe palette option
- Performance pass (voice budget, audio off-main-thread, load times)
- Web demo build (≤ 150 MB, autoplay-gesture handling)
- Pause menu, assist toggles, store assets

**Stories:**
- S6.1: Audio visualizer assist
- S6.2: Colorblind palette variant
- S6.3: Performance pass (60 fps on low-spec, load ≤ 5s)
- S6.4: Web demo build + autoplay policy handling
- S6.5: Pause/menu screens + store-page assets (screenshots, trailer-ready capture)

**Acceptance:** all accessibility toggles work; performance metrics pass; web build ships on itch.io.

---

## Epic Sequence

```
E1 (audio prototype) ──▶ E2 (movement+rendering+meadow)
        │                        │
        ▼                        ▼
     E3 (puzzles) ◀──────── E4 (shaping)  ──▶ E5 (full trail + finale)
                                        │
                                        ▼
                                     E6 (accessibility + polish)
```

E1 gates all content. E2 and E3 can overlap after E1. E4 depends on E2's meadow + E3's fragment economy. E5 depends on E3+E4. E6 is polish/parallel with late E5.