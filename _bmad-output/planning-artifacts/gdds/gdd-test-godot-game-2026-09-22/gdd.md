---
title: 'The Living Walk - Game Design Document'
game_type: 'Adventure'
platforms:
  - 'PC (Steam)'
  - 'Web (demo)'
created: '2026-09-22'
updated: '2026-09-22'
status: 'draft'
---

# The Living Walk - Game Design Document

**Author:** Joshe
**Game Type:** Adventure
**Target Platform(s):** PC (Steam) primary; Web for demos

---

## Executive Summary

### Core Concept

The Living Walk is a 2D nature-walk game in quiet SVG linework where you experience the world through sound: the landscape composes a living score as you move, and the melodies you plant grow into the world itself.

### Target Audience

Adults 25-45 who play short, atmospheric sessions to decompress — cozy-game and walking-sim fans who value mood, sound, and emotional payoff over challenge. Secondary: core gamers and music/audio enthusiasts curious about generative sound systems.

### Unique Selling Points (USPs)

1. Hearing-first design — audio is the gameplay, not garnish
2. The player's plantings ARE the finale — the ending replays the songs the player grew
3. Generative score with player authorship
4. Cozy × audio-novelty intersection (unowned market gap)

---

## Goals and Context

### Project Goals

- Deliver a solo-dev-achievable, wordless 20-40 minute walk
- Prove the generative audio system is the game's heart (prototype-first milestone)
- Make players feel they listened to a place — and the place listened back

### Background and Rationale

Note-driven Godot project ("a test godot game"). The old Python CLI experiment is being replaced by a Godot 4.x game. The Living Walk emerged from the GDS brainstorm (Party Mode: Samus Shepard / Cloud Dragonborn / Indie consensus) and was formalized in the game brief. The cozy market is expanding, audio-led experiences are a proven niche (Proteus), and no title owns hearing-first cozy exploration.

---

## Core Gameplay

### Game Pillars

1. **Hearing is the sense** — The world is navigated and understood through sound; sight is deliberately subdued, making audio the primary discovery channel for every mechanic, landmark, and secret.
2. **The world composes with you** — The environment is a generative music system; player movement, actions, and plantings all feed the living score in real time.
3. **Gentle, deep world-shaping** — Planting song-seeds is the core act of creation: melodies take root, grow, and permanently alter both the soundscape and the terrain.
4. **One walk, one payoff** — A single continuous journey with a designed arc, ending in a hilltop finale that plays the whole walk back; no fail states, no grinding loops.

**Pillar Priority:** 1 (Hearing) > 2 (World composes) > 3 (Shaping) > 4 (One walk). Any feature fighting the hearing-first principle gets cut.

### Core Gameplay Loop

Walk a stretch of woodland → listen to identify what the world is offering → discover a melody fragment or route → plant a song-seed / open a path → hear the score grow → progress toward the hilltop → finale replays the entire journey as one song.

### Win/Loss Conditions

**No failure states.** The "win" is reaching the hilltop with a world shaped by the player's choices — the finale completes when the journey has been played back. Time is not punished; there is no health, no death, no game over.

---

## Game Mechanics

### Primary Mechanics

- **Walk / move** — foundational verb; movement speed maps to musical tempo and texture. Base walk speed 3.0 tiles/s; optional run (hold Shift) 4.5 tiles/s with a slightly brighter timbre; no stamina.
- **Listen** (hold-to-attend) — press-and-hold to focus a direction: distant sound sources within a 45° cone are highlighted as soft glowing ripples and their pitch/pan is amplified for 1.5s. Cooldown none; directional only. This is the primary discovery tool.
- **Discover** — environmental cues (breezes, creatures, chimes) mark points of interest and secrets. Each POI has a distinct sonic signature (e.g., a 3-note bird motif for a hidden melody fragment).
- **Plant song-seed** — select a melody fragment (found in the world, up to 8-12 total) and place it in a marked soil-ring. The seed roots over 8s (visual sprout + growing audio voice), then joins the score permanently.
- **Shape terrain** — matured plants alter the path: growth bridges across streams, blooms open gates, thickets part. Each shaping act is audible (a resolving chord) and visual (the linework blooms).
- **Return to the hilltop** — the finale: the full journey replays as one accumulating song (see Progression).

**Core Loop:** Walk → Listen → Discover → Plant/Shape → Score grows → Hilltop finale.

### Controls and Input

| Input | Action |
|-------|--------|
| WASD / Arrow keys | Move (8-direction, gentle acceleration) |
| Shift (hold) | Walk faster (brighter timbre) |
| Mouse / Right-stick aim + E / A (hold) | Listen (directional focus) |
| 1-4 / D-pad | Select melody fragment |
| E / X (on soil-ring) | Plant song-seed |
| Esc / Start | Pause menu (assist toggles, quit) |

Gamepad fully supported alongside keyboard/mouse. No camera-relative aiming complexity — Listen always orients to the player's facing/pointer.

---

## Adventure Specific Design

### Exploration Mechanics

**Exploration design:**

- **World structure:** linear-with-branches — one continuous trail through 5-6 biomes, with side-pockets (glades, hollows) that hide optional melody fragments. No backtracking required; no locked-door gating except terrain-shaping gates.
- **Movement and traversal:** continuous 8-direction walk; gentle acceleration and deceleration (accel 12 tiles/s², decel 18 tiles/s²) for a calm, gliding feel. No jumping, no climbing — traversal is walking and the terrain the player shapes.
- **Observation and inspection:** the Listen mechanic is the inspection tool; holding Listen on a POI reveals its identity (melody fragment, gate, story-echo).
- **Discovery rewards:** melody fragments (8-12), story-echoes (sonic vignettes that deepen atmosphere), and shaped routes. Every discovery is audible first.
- **Pacing of exploration vs. story:** exploration IS the story — the world wakes up as play proceeds; new biomes introduce new voice layers in the score.

### Story Integration

**Narrative gameplay:**

- **Story delivery methods:** purely environmental/emergent — wordless, no text, no cutscenes. The score carries all narrative weight.
- **Player agency in story:** linear arc, player-driven texture — the beat structure is fixed (sparse → waking → dense → hush → finale), but what fills each beat is the player's own compositions.
- **Story pacing:** acts defined by score density: (1) Sparse meadow — the world is quiet; (2) Groves — first seeds, first growth; (3) Stream crossing — terrain shaping becomes necessary; (4) Pine ridge — dense, confident score; (5) The hush — approach to the hilltop strips the score back; (6) Finale — full reprise.
- **Character introduction and development:** no characters; the world (and its sound) is the character, developing as the player shapes it.
- **Climax and resolution:** the hilltop finale — a wordless, unskippable reprise of the journey as one song, then silence and a single closing note.

### Puzzle Systems

**Puzzle integration:**

- **Puzzle types:** audio puzzles only — three kinds: (a) *Locate* — triangulate a hidden fragment by listening to its motif and following its pan/volume; (b) *Sequence* — trigger two or three sound sources in the correct musical order (they sing a resolution when correct); (c) *Awaken* — bring a silent source "to life" by planting a seed near it (its motif joins the score).
- **Puzzle difficulty curve:** Locate first (single source, generous cone), then Sequence (2 sources, then 3), then Awaken (requires having a compatible fragment). Gentle ramp; no time pressure.
- **Hint systems:** Listen is the built-in hint — holding it longer (2s+) on a stuck puzzle gently swells the target's motif and pulses its direction.
- **Puzzle-story connection:** each resolved audio puzzle produces a fragment that becomes part of the player's musical footprint (and hence the finale).
- **Optional vs. required puzzles:** ~5 required (one per biome to progress); ~4-6 optional (side-pockets for extra fragments/layers in the finale).

### Character Interaction

**NPC systems:** None — intentionally. The world is the only "character." Instead of dialogue, interaction is *listening*: every place the player attends to responds musically. A "relationship" is formed with the world itself, measured in how much of its music the player has awakened. (Replacing the template's NPC/dialogue subsections — no analog in a wordless game.)

### Inventory and Items

**Item systems:**

- **Inventory scope:** single held melody fragment at a time + a growing "awakened voices" ledger (what has joined the score). No consumables, no currency, no equipment.
- **Item examination:** fragments are experienced, not described — selecting a fragment plays its motif; no inspection prompts, no item text.
- **Combination/crafting:** none — placement is the only act; the world's "crafting" is the generative layering of planted voices.
- **Story-critical items vs. optional items:** the 5 required fragments gate progression; optional fragments deepen the finale's texture.
- **Item-based progression gates:** terrain gates (growth bridges, blooms) are opened by planted seeds — a direct, diegetic progression key.

### Environmental Storytelling

**World narrative:**

- **Visual storytelling techniques:** subtle — linework that "blooms" where seeds grow; palette shifting by biome; the hilltop silhouette visible from the first meadow as the destination.
- **Audio atmosphere:** the primary narrative channel — each biome has a voice layer set; creatures and breezes carry motifs; the score's density tells the story's position in the arc.
- **Readable documents:** none (wordless) — replaced by *audible echoes*: rare one-time sonic vignettes (a distant memory of a previous walk, hinted not explained).
- **Environmental clues:** sound sources are the clues — a chime means a gate; a bird motif means a hidden fragment; a sustained drone means approaching the hush.
- **Show vs. tell balance:** purely show, via sound — the game never tells the player what a sound means; it teaches through first contact (first chime, first bird, first gate).

---

## Progression and Balance

### Player Progression

Progression is musical and spatial, not numeric:
- **World density:** each planted seed adds a permanent voice → the score thickens → biomes unlock via terrain shaping.
- **Melody ledger:** fragments collected (8-12) expand what the player can plant, and thus the finale's complexity.
- **Arc position:** five beat-gates (sparse → waking → dense → hush → finale) define where the player is in the walk.

### Difficulty Curve

No traditional difficulty (no fail states). Ramp is *attention* difficulty: early puzzles have wide Listen cones and single sources; later puzzles require finer triangulation and sequencing. Calibrated so the target audience (short, calm sessions) never feels blocked — the hint swell (hold Listen 2s+) guarantees progress.

### Economy and Resources

No currency, no resources, no timers. The only "economy" is composition: each biome offers exactly enough fragments to open its gate, with optional extras for depth. Fragment counts: 5 required + 4-6 optional = 9-11 total, within the 8-12 target.

---

## Level Design Framework

### Level Types

Six biome areas along one trail, each with a distinct voice layer and one audio puzzle:

1. **The Meadow** (tutorial biome) — teaches Walk + Listen + first Locate puzzle; sparse score, 2 voices.
2. **The Oak Grove** — first Sequence puzzle (2 sources); introduces plant-shaping (first gate).
3. **The Stream Crossing** — first Awaken puzzle; growth-bridge terrain shaping.
4. **The Pine Ridge** — Sequence (3 sources); landscape opens, score densest mid-game.
5. **The Clearing** — quiet midpoint: optional echoes, atmosphere beat before the hush.
6. **The Hill** — the hush (score strips to a single drone) → hilltop finale.

### Level Progression

Strictly forward through biomes 1→6 with optional side-pockets (glades/hollows) containing extra fragments and echoes. Terrain gates need: 1 seed (Grove), 2 seeds (Stream), 2 seeds (Pine Ridge) — counts balance the required-fragment economy. Replayability: each playthrough's finale differs because plantings differ.

---

## Art and Audio Direction

### Art Style

Quiet 2D SVG linework: soft, low-contrast palette (sage, dusk-blue, pale gold); stylized minimal shapes; gentle scale-based parallax; deliberately subdued (readability through audio). Lightweight animation: sway, drift, bloom on planted seeds. Palette shifts per biome within the same family.

**References:** Gris (emotional minimalism), A Short Hike (friendly smallness), classic botanical illustration (structure).

### Audio and Music

The living score IS the game. Generative ambient-folk compositional system from layered voices:

| Voice layer | Role | Source |
|-------------|------|--------|
| Wind | Bed (constant texture) | Biome base — always present |
| Grass/Footholds | Rhythm | Player movement, footstep timing |
| Creatures | Counter-melody | Scripted per biome, swells near POIs |
| Planted melodies | Harmony (persistent) | Player's seeds — permanent |
| The drone | Hush signal | Approach to finale |

Procedurally synthesized, runtime-generated voices (target: real-time generation ≤ 16 simultaneous voices); no pre-baked soundtrack files, no voice acting. Scale-system tone (pentatonic vs folk-modal) locked during audio prototype (open question from brief).

---

## Technical Specifications

### Performance Requirements

- 60 FPS sustained on low-spec laptops (integrated graphics) over a 10-minute continuous walk
- Audio engine: bounded voice budget (≤ 16 simultaneous voices), no frame drops (audio work off the main thread where possible)
- Load time ≤ 5s to first playable frame; no streaming seams between biomes

### Platform-Specific Details

- **PC (Steam):** keyboard/mouse + full gamepad; 16:9 and 16:10; windowed/borderless/fullscreen; Steam features minimal (achievements for arc milestones, no cloud-save complexity beyond one continuous session — decision deferred: brief open question)
- **Web (demo):** same scene graph; audio must init on first user gesture (browser autoplay policy); file-size budget ≤ 150 MB

### Asset Requirements

| Asset | Qty/Budget | Source |
|-------|-----------|--------|
| SVG biome scenes | 6 biome sets (tiles/bg/layers) | In-house tooled |
| Melody fragments | 9-11 (audio data, procedural) | Procedural — no files |
| Voice layers | 12-16 synth presets | Procedural — no files |
| UI (minimal) | 4-6 screens | In-house |

---

## Development Epics

| # | Epic | Summary |
|---|------|---------|
| E1 | Audio Engine Prototype | Standalone generative-score scene; prove musicality; lock scale system |
| E2 | Core Movement + SVG Rendering | Walk/listen loop, SVG import pipeline, first biome (meadow) |
| E3 | Audio Puzzles | Locate / Sequence / Awaken systems + hint swell |
| E4 | Song-Seed + Terrain Shaping | Planting, growth, gates; world-state persistence (one session) |
| E5 | Full Trail + Finale | Biomes 2-6, hush, hilltop reprise |
| E6 | Accessibility + Polish | Visualizer assist, colorblind palette, performance pass |

*Detailed epics and high-level stories: see `epics.md`.*

---

## Success Metrics

### Technical Metrics

- 60 FPS on target low-spec machine, 10-min walk
- Audio prototype passes external-listener musicality gate
- ≤ 16 audio voices; no audio-related frame spikes
- Web demo ≤ 150 MB; load ≤ 5s

### Gameplay Metrics

- Playtesters find all seeded POIs by ear alone in < 2 min per area (wayfinding gate)
- ≥ 75% of demo players reach the miniature payoff
- ≥ 60% of playtest feedback mentions "calm/beautiful/moved" unprompted
- Launch: ≥ 5,000 Steam wishlists; ≥ 80% positive reviews; ≥ 10% demo-to-purchase

---

## Out of Scope (v1.0)

- Combat, enemies, fail states, timers
- Dialogue, text, cutscenes, voice acting
- Multiple walks / new-game-plus / sandbox post-ending
- Online features, leaderboards, cloud saves (single-session state only)
- Full accessibility spec beyond visualizer + colorblind palette (deferred to polish)
- Mobile / console ports at launch

## Assumptions and Dependencies

- [ASSUMPTION: Scale-system tone (pentatonic vs folk-modal) deferred to audio prototype — brief open question]
- [ASSUMPTION: Web build ships after PC release — brief open question]
- [ASSUMPTION: Fragment count 9-11 total (5 required + 4-6 optional) within brief's 8-12 target]
- Depends on: generative audio feasibility (E1 prototype gate); SVG-to-Godot pipeline maturity
- Feeds: gds-create-narrative (needs_narrative flag set) → gds-game-architecture → production