# Story 1.1: AudioStreamGenerator voice pool

Status: ready-for-dev

## Story

As a Godot developer,
I want to implement a bounded voice pool for the generative audio system
so that the audio engine stays within the ≤16 simultaneous voice budget defined in the GDD and supports configurable voice layers per biome.

## Acceptance Criteria

1. Voice pool is bounded at ≤ 16 simultaneous voices (enforced at initialization and runtime via voice budget guard)
2. Voice pool is configurable via voice-layer definitions (wind bed, grass/foothold rhythm, creature counter-melodies, planted melodies, drone)
3. Audio prototype passes external-listener musicality test (60 FPS sustained with audio running; non-project listeners describe output as "music," not "noise")
4. Scale system selector (pentatonic/folk-modal) is integrated and functional per GDD#Audio-and-Music
5. Voice pool supports dynamic addition/removal of voice layers per biome section (meadow→grove→stream→pine→clearing→hill)

## Tasks / Subtasks

- [ ] Task 1: Implement AudioStreamGenerator voice pool scene setup
  - [ ] Subtask 1.1: Configure VoicePool autoload with ≤16 voice budget and dynamic reconfiguration
  - [ ] Subtask 1.2: Implement voice layer definitions (wind, grass/footholds, creatures, planted melodies, drone) per GDD#Audio-and-Music table
- [ ] Task 2: Implement scale system selector
  - [ ] Subtask 2.1: Add pentatonic/folk-modal tone selection interface
  - [ ] Subtask 2.2: Integrate with generative_score.gd architecture at scripts/systems/ per architecture doc patterns
- [ ] Task 3: Implement external-listener musicality test harness
  - [ ] Subtask 3.1: Create test scene for 3 non-project listener evaluation
  - [ ] Subtask 3.2: Document musicality evaluation criteria (GDD#Success-Metrics external-listener gate)
- [ ] Task 4: Configure voice budget monitoring and FPS guardrails
  - [ ] Subtask 4.1: Implement voice count tracking and per-frame logging
  - [ ] Subtask 4.2: Add FPS/audio performance guardrails to sustain 60 FPS on low-spec laptops over 10-minute walks (GDD#Performance-Requirements)

## Dev Notes

- Relevant architecture patterns: event bus, autoloads, generative_score.gd at scripts/systems/ (GDD#Technical-Specifications)
- Source tree components to touch: scripts/systems/generative_score.gd, project-level autoload configuration for VoicePool
- Testing standards: external listener musicality test (GDD#Success-Metrics), 60 FPS sustained target (GDD#Performance-Requirements), ≤16 voice budget (GDD#Technical-Specifications)
- Key convention: all voice layers must respect the ≤16 simultaneous voice limit; scale tone locked during audio prototype phase (brief open question from GDD#Assumptions-and-Dependencies)
- E1 gates all content — no content work begins until E1 prototype passes external musicality test
- Epic sequence: E1 → (E2 and E3 can overlap) → E4 depends on E2's meadow + E3's fragment economy → E5 depends on E3+E4

### Project Structure Notes

- Alignment with unified project structure: Godot 4.x project, audio systems in scripts/systems/
- Voice Pool autoload registered at project startup, accessible via VoicePool singleton or AudioServer bus
- All voice layer definitions stored as configurable data (not hardcoded), enabling per-biome reconfiguration
- No pre-baked soundtrack files — all voices are procedurally synthesized at runtime (GDD#Audio-and-Music: "Procedurally synthesized, runtime-generated voices (target: real-time generation ≤ 16 simultaneous voices)")

### References

- [Source: gdd.md#Audio-and-Music] — Voice layers (wind, grass/footholds, creatures, planted melodies, drone), scale-system tone, ≤16 simultaneous voices
- [Source: gdd.md#Technical-Specifications] — Performance requirements (60 FPS, ≤16 voices, load ≤5s), platform details
- [Source: gdd.md#Development-Epics] — E1 gates all content, epic sequence diagram
- [Source: epics.md#E1---Audio-Engine-Prototype] — E1 goal, scope, S1.1 story foundation, acceptance criteria
- [Source: epics.md#Epic-Sequence] — Epic dependencies (E1 gates E3+E4, E5 depends on E3+E4)
- [Source: sprint-status.yaml] — Story tracking, status: backlog → ready-for-dev, story_location
- [Source: narrative-design.md#Voice-Elements] — Generative score voice layer definitions beyond dialogue
- [Source: narrative-design.md#Success-Metrics] — External-listener musicality test gate
- [Source: gdd.md#Success-Metrics] — Technical metrics (60 FPS, ≤16 voices, web ≤150 MB)

## Dev Agent Record

### Agent Model Used

{{agent_model_name_version}}

### Debug Log References

### Completion Notes List

### File List