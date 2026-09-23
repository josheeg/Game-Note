---
stepsCompleted: [1, 2, 3, 4, 5, 6, 7, 8]
inputDocuments:
  - "_bmad-output/brainstorming-session-2026-09-22.md"
documentCounts:
  brainstorming: 1
  research: 0
  notes: 0
workflowType: 'game-brief'
lastStep: 8
project_name: 'test-godot-game'
user_name: 'Joshe'
date: '2026-09-22'
game_name: 'The Living Walk'
---

# Game Brief: The Living Walk

**Date:** 2026-09-22
**Author:** Joshe
**Status:** Draft for GDD Development

---

## Executive Summary

The Living Walk is a 2D nature-walk game in quiet SVG linework where you experience the world through sound: the landscape composes a living score as you move, and the melodies you plant grow into the world itself.

**Target Audience:** Adults 25-45 who play short, atmospheric sessions to decompress — cozy-game and walking-sim fans. Secondary: core gamers and audio/music enthusiasts curious about generative sound systems.

**Core Pillars:** Hearing is the sense · The world composes with you · Gentle, deep world-shaping · One walk, one payoff.

**Key Differentiators:** Hearing-first design (audio is gameplay, not garnish); the player's plantings ARE the finale; generative score with player authorship; the cozy × audio-novelty gap.

**Platform:** PC (Steam) primary, Web for demos.

**Success Vision:** A solo-dev-achievable, wordless 20-40 minute walk that makes players feel they listened to a place — and that the place listened back — validated by a prototype-first audio milestone.

---

## Game Vision

### Core Concept

The Living Walk is a 2D nature-walk game in quiet SVG linework where you experience the world through sound: the landscape composes a living score as you move, and the melodies you plant grow into the world itself.

### Elevator Pitch

The Living Walk is a meditative 2D exploration game about one walk through a woodland that listens. You navigate by ear — every step, breeze, and creature adds a voice to a score the world composes in real time — and you plant song-seeds that grow into permanent melodies shaping both the soundscape and the land. At the end of the trail you round the final hilltop and hear your entire journey played back as a single song.

### Vision Statement

I want players to set down the controller feeling that they listened to a place — and that the place listened back. The Living Walk is a game with no enemies and no fail states, where attention is the mechanic: the reward is hearing the world you helped grow sing your walk back to you.

---

## Target Market

### Primary Audience

Adults 25-45 who play short, atmospheric sessions to decompress — cozy-game and walking-sim fans who value mood, sound, and emotional payoff over challenge.

**Demographics:**
25-45, mixed gender (leaning female per cozy-game trends), PC first, accessible to low-spec and laptop players (SVG rendering is intentionally lightweight).

**Gaming Preferences:**
Cozy/atmospheric titles (Firewatch, Gris, A Short Hike, Unpacking); prefer short sessions (20-40 min) with no fail states; strong appreciation for original soundtracks and generative audio.

**Motivations:**
Stress relief, sensory immersion, gentle creative expression (planting song-seeds = shaping the world), and a meaningful outro that rewards their attention.

### Secondary Audience

Core gamers and music/audio enthusiasts curious about procedural audio — players who enjoy generative systems (e.g. Ape Out, Proteus, Beat Saber's rhythm focus) and want to experience "the world as an instrument."

### Market Context

The cozy game market has expanded dramatically post-2020, and audio-led experiences remain a niche: Proteus proved generative soundscapes can carry a game, but no recent title centers *hearing as the primary discovery sense* in a walkable world.

**Similar Successful Games:**
Proteus (generative soundscape exploration), A Short Hike (small cozy world, gentle goals), Firewatch (walk + atmosphere + emotional ending), Eastshade (creative world-shaping), Gris (art-guided emotional journey).

**Market Opportunity:**
A gap exists between walking-sim mood and generative-audio novelty. The Living Walk fills it: a cozy, no-fail 2D walk where the world composes the soundtrack and the player's own plantings become the finale. Short runtime + minimal art/tooling cost make it feasible for a solo dev with dev-experience level 1.

---

## Game Fundamentals

### Core Gameplay Pillars

1. **Hearing is the sense** — The world is navigated and understood through sound; sight is deliberately subdued, making audio the primary discovery channel for every mechanic, landmark, and secret.
2. **The world composes with you** — The environment is a generative music system; player movement, actions, and plantings all feed the living score in real time.
3. **Gentle, deep world-shaping** — Planting song-seeds is the core act of creation: melodies take root, grow, and permanently alter both the soundscape and the terrain.
4. **One walk, one payoff** — A single continuous journey with a designed arc, ending in a hilltop finale that plays the whole walk back; no fail states, no grinding loops.

**Pillar Priority:** When pillars conflict, prioritize in order: 1 (Hearing) > 2 (World composes) > 3 (Shaping) > 4 (One walk). Any feature that fights the hearing-first principle gets cut.

### Primary Mechanics

- **Walk / move** — the foundational verb; movement speed maps to musical tempo and texture
- **Listen** (hold-to-attend) — focus a direction to highlight and identify distant sound sources
- **Discover** — environmental cues (breezes, creatures, chimes) mark points of interest and secrets
- **Plant song-seed** — choose a melody fragment (found or earned) and place it; it roots, grows, and joins the score
- **Shape terrain** — matured plants alter the path (growth bridges, blooms open routes), unlocking new areas
- **Return to the hilltop** — the finale: the full journey replays as one accumulating song

**Core Loop:** Walk a stretch of woodland → listen to identify what the world is offering → discover a melody fragment or route → plant a song-seed / open a path → hear the score grow → progress toward the hilltop → finale replays the entire journey as one song.

### Player Experience Goals

- **Relaxation/Flow** — unhurried, no-fail exploration; the score sets the pace
- **Discovery/Surprise** — audio-first reveals: every new sound is a potential secret
- **Creativity/Expression** — song-seed placement makes each player's world (and finale) their own
- **Connection/Meaning** — the hilltop playback turns the session into something emotionally earned

**Emotional Journey:** Open with a quiet, almost empty soundscape → gradually the world "wakes up" around the player's choices → a middle of confident creativity as the score thickens → a hushed, anticipatory ascent → the finale: a full, triumphant reprise that rewards the attention given all along.

---

## Scope and Constraints

### Target Platforms

**Primary:** PC (Steam) — desktop first, keyboard/mouse + gamepad
**Secondary:** Web export (Godot 4 web) for demos/shareability; possible later ports if the PC release validates.

### Budget Considerations

Shoestring/solo budget. Godot 4 is free; SVG art is generated/tooled in-project (no asset-store dependency); audio is procedurally synthesized (GDScript/AudioStreamGenerator) — no licensed music or SFX. Marketing is DIY (screenshots, a short trailer, itch.io + Steam page). Only expected costs: Steam listing fee and optional store art outsourcing if needed.

### Team Resources

Solo developer (Joshe), dev-experience level 1. All roles in one person: design, programming (GDScript), SVG art, audio (procedural), and marketing. Part-time availability; development is the GDS pipeline itself (planned, story-driven, agent-assisted).

**Skill Gaps:** Live-audio synthesis and generative-music design; SVG scene/tooling in Godot (2D); procedural terrain/growth simulation; and marketing/press. These are the highest-risk areas for the solo dev.

### Technical Constraints

- **Engine:** Godot 4.x (GDScript, 2D)
- **Rendering:** SVG-sourced sprites/scenes — lightweight, low-spec friendly
- **Audio:** Procedural generation via AudioStreamGenerator; no pre-baked soundtrack — the living score is computed at runtime
- **Scope guardrails:** Single walk (20-40 min), no networking, no combat, no save-slot complexity (one continuous session)
- **Performance:** Must hold 60 fps on low-spec laptops; audio engine must stay within strict voice/filter budget
- **Accessibility:** Visual-subtlety is a design tenant → colorblind-safe palette option and an on-screen "audio visualizer" assist toggle

### Scope Realities

The game is deliberately small: one continuous walk, one core loop, procedurally-generated audio instead of a licensed score. The risky novelty is the generative audio system — it should be prototyped first as a standalone scene before any content is built. If the living-score audio proves too complex, fallback is a layered/pre-composed score keyed to player position (still no licensing cost).

---

## Reference Framework

### Inspiration Games

**Proteus**
- Taking: The generative soundscape-as-world principle — audio is the primary texture of the environment
- Not Taking: The abstract/no-goal format; the first-person interactive-art presentation

**A Short Hike**
- Taking: The small, friendly open walk; gentle discovery; a summit payoff that rewards exploration
- Not Taking: The pixel-art aesthetic (we use quiet SVG linework); the collectible/coin economy

**Firewatch**
- Taking: A single continuous walk with an emotional arc; atmosphere carried by audio and light; a story that pays off at the end
- Not Taking: The dialogue-driven narrative and mystery plot (The Living Walk is wordless)

**Gris**
- Taking: Art-and-music-led emotional journey; no fail states; the world transforms as you progress
- Not Taking: The platforming precision; the hand-painted art style (we stay SVG-light)

**Eastshade**
- Taking: Creative world-shaping as the central act — you leave permanent marks on the world
- Not Taking: The quest-giving NPC economy and full crafting systems

### Competitive Analysis

**Direct Competitors:**
Proteus (generative soundscape exploration), A Short Hike (cozy walk + summit payoff), Eastshade (artistic world-shaping), plus the broader cozy/walking-sim field (Firewatch, Gris, Unpacking).

**Competitor Strengths:**
Proteus proved generative audio can carry a whole game. A Short Hike proved a short, friendly walk with a summit payoff satisfies. Eastshade proved players love leaving permanent creative marks.

**Competitor Weaknesses:**
Proteus has no goals or player agency — drift, not play. A Short Hike's audio is decorative, not generative. Eastshade is large and quest-bound — heavy for a solo dev. None of them make *hearing* the primary discovery sense; none let the player's musical choices become the ending.

### Key Differentiators

1. **Hearing-first design** — every gameplay system is built around listening; sight is deliberately secondary (competitors treat audio as atmospheric garnish)
2. **The player's plantings ARE the finale** — the ending literally replays the songs the player grew; the world's final melody is co-authored, unique to each run
3. **Generative score with player authorship** — not just procedural ambience (Proteus) but a musical system the player actively composes into
4. **Cozy + audio-novelty intersection** — occupies the gap between walking-sim mood and generative-music novelty; no current title owns both

**Unique Value Proposition:**
"A meditative walk where you hear the world compose itself — and the songs you plant become the soundtrack of your own ending."

---

## Content Framework

### World and Setting

A single quiet woodland — one continuous trail in a soft-focus, SVG-linework world. Not a named fantasy realm: an intimate, semi-abstract forest of meadows, groves, a stream crossing, and one final hill. Atmosphere is hushed and alive; the world has "presence" through sound rather than lore. Depth comes from how the land responds to the player's plantings, not from backstory.

### Narrative Approach

Environmental + Emergent — wordless. The story is told by the score: the world starts sparse and wakes up around the player's choices. Each planted song-seed is a permanent, audible memory; the hilltop finale is the narrative climax — the player's own journey, recomposed.

**Story Delivery:** Purely sonic and spatial — no text, no dialogue, no cutscenes. Progression is audible (the thickening score) and visible (the growing land).

### Content Volume

One walk, ~20-40 minutes: roughly 5-6 distinct biomes/areas (meadow, oak grove, stream, pine ridge, clearing, hilltop). ~8-12 discoverable melody fragments. One finale sequence. Intentionally minimal — content is system-driven, not hand-authored.

---

## Art and Audio Direction

### Visual Style

Quiet 2D SVG linework: soft, low-contrast palette (sage, dusk-blue, pale gold); stylized, minimal shapes; gentle scale-based parallax. Deliberately *subdued* — readability through audio, not visual noise. Lightweight animation (sway, drift, subtle bloom on planted seeds).

**References:** Gris (emotional minimalism), A Short Hike (friendly smallness), classic botanical illustration linework (structure).

### Audio Style

The living score IS the game: generative, ambient-folk compositional system built from layered voices — wind (bed), grass/footholds (rhythm), creatures (counter-melody), planted melodies (harmony that persists). No pre-baked soundtrack, no voice acting. Audio-first accessibility: colorblind-safe palette + optional on-screen sound visualizer.

### Production Approach

100% in-house: SVG art authored/tooled in-project; audio synthesized procedurally in GDScript (AudioStreamGenerator) — zero licensing cost. No outsourcing planned; no asset-store dependencies. AI-generation tools acceptable for art prototyping only if they accelerate the SVG pipeline.

---

## Risk Assessment

### Key Risks

1. **Generative audio system complexity** (technical, HIGH impact / MEDIUM likelihood) — the living score is the whole game; if it fails to sound musical, the game fails
2. **"Hearing-first" readability** (technical/design, HIGH impact / MEDIUM likelihood) — players must reliably navigate and discover by ear; risk of frustration or "I can't find anything"
3. **Cozy-audio niche size** (market, MEDIUM impact / MEDIUM likelihood) — audio-led cozy games are a proven-but-small segment; discoverability depends on the hook landing
4. **Solo bandwidth** (team, HIGH impact / MEDIUM likelihood) — one person owns art + code + audio + marketing; burnout or scope drift kills delivery

### Technical Challenges

- Real-time musical composition that stays pleasant (voice layering, key/scale constraints, density limits)
- Low-latency audio synthesis in GDScript without frame drops (60 fps on low-spec laptops)
- SVG scene/tooling pipeline in Godot 4 2D
- Audio-as-navigation: spatial sound cues that are clear but not "radar-like"

### Market Risks

- Niche audience caps; walking-sims have a ceiling on price/expectation
- Hard to communicate "generative audio gameplay" in a store page/trailer
- Comparisons to Proteus (older, abstract) may set wrong expectations

### Mitigation Strategies

1. **Prototype-first:** standalone audio scene before any content — if it doesn't sing, pivot to layered adaptive score (fallback documented in Scope)
2. **Assist mode:** optional visualizer + directional hints for audio-blind players; playtest early for wayfinding
3. **Demo-first marketing:** a tight demo that sells the hilltop payoff in 10 minutes; trailer built around the final reprise
4. **Pipeline discipline:** GDS epics/stories keep scope pinned; playtest-plan and performance-test skills gate each milestone

---

## Success Criteria

### MVP Definition

A playable standalone slice proving the concept: **one biome (the meadow)**, working walk + listen mechanics, a generative score that grows as you move, 2-3 plantable song-seeds that audibly persist, and a miniature "hilltop" payoff that replays the journey so far. No full-narrative, no final hill, no art polish.

### Success Metrics

- **Prototype gate:** Audio prototype (standalone scene) must sound genuinely musical to external listeners before any content build
- **Wayfinding:** Playtesters can find all seeded points of interest by ear alone in < 2 min per area
- **Completion rate:** ≥ 75% of demo players reach the (miniature) payoff
- **Emotional response:** ≥ 60% of playtest feedback mentions "calm/beautiful/moved" unprompted
- **Launch targets:** Steam wishlists ≥ 5,000 pre-launch; "Very Positive" reviews (≥ 80% positive); demo-to-purchase conversion ≥ 10%

### Launch Goals

Steam PC launch with a 10-minute demo; positive-review majority; a trailer built around the final reprise; Web demo embedded on itch.io for press/shareability.

---

## Next Steps

### Immediate Actions

1. **Prototype the generative audio system** as a standalone scene — the highest-risk element, per Scope
2. **Proceed to GDD** (gds-create-gdd) — transform this brief into a detailed design document, including story/audio system specifications
3. **Art style test** — 2-3 SVG linework palette studies to lock the visual direction
4. **Market validation** — share the brief + art styles with cozy-game communities for early interest signal

### Research Needs

- Godot 4 audio synthesis best practices (AudioStreamGenerator, voice budgeting, latency)
- SVG-to-Godot import/tooling options for smooth 2D linework rendering
- Cozy-game pricing benchmarks for a 20-40 min experience

### Open Questions

- Exact tone/mood of the generative scale system (pentatonic vs folk-modal) — to be locked during audio prototype
- Number of discoverable melody fragments per biome (8-12 total assumed)
- Whether the Web build ships at launch or follows the PC release

---

## Appendices

### A. Research Summary

{{research_summary}}

### B. Stakeholder Input

{{stakeholder_input}}

### C. References

{{references}}

---

_This Game Brief serves as the foundational input for Game Design Document (GDD) creation._

_Next Steps: Use the `workflow gdd` command to create detailed game design documentation._