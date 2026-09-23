# Performance Test Plan: The Living Walk

**Version**: 1.0
**Created**: 2026-09-22
**Author**: Joshe

---

## Overview

### Performance Philosophy

"The Living Walk" is a hearing-first, 2D nature-walk game where the world composes a living score through procedural audio. Performance is critical because audio is the primary gameplay channel — frame drops directly impact the generative audio system and player experience. The game uses lightweight 2D SVG linework with gentle parallax and bounded voice synthesis (≤16 simultaneous voices). The performance target is 60 FPS sustained on low-spec laptops with integrated graphics over a 10-minute continuous walk, with load times ≤5s to first playable frame and web demo size ≤150 MB.

### Target Experience

- **Primary target**: PC (Steam) at 60 FPS on low-spec laptops (integrated graphics)
- **Minimum viable**: PC at 30 FPS with scaled settings; Web demo at 30 FPS with reduced voice count
- **Success metric**: 60 FPS average over 10-minute walk, ≤5s load time, ≤150 MB web export, ≤16 simultaneous audio voices with no frame drops

---

## Performance Targets

### Frame Rate

| Platform | Target FPS | Minimum FPS | Mode |
|----------|-----------|-------------|------|
| PC (High) | 60+ | 30 | Uncapped option |
| PC (Low) | 30 | 30 | Scalable settings, reduced voice budget |
| Web (Demo) | 30 | 30 | Browser autoplay policy, reduced assets |

### Memory Budget

| Platform | Total RAM | Game Budget | Reserve |
|----------|-----------|-------------|---------|
| PC (Min spec) | 8 GB | 4 GB | 4 GB for OS |
| Web Browser | 4 GB | 1.5 GB | 2.5 GB for browser |

### Loading Times

| Scenario | Target | Maximum | Notes |
|----------|--------|---------|-------|
| Initial boot | < 5s | 10s | To first playable frame |
| Level/biome load | < 3s | 5s | No streaming seams between biomes |
| Resume from pause | < 2s | 5s | Quick resume |

---

## Test Scenarios

### Frame Rate Tests

**SCENARIO: Maximum Voice Count Stress**
- GIVEN: Game running with 16 simultaneous generated voices (the maximum budget)
- WHEN: Player walks through all 6 biomes (10-minute continuous walk)
- THEN: Frame rate stays at ≥30 FPS minimum, ≥60 FPS target
- AND: No audio-related frame spikes
- AND: CPU audio work off main thread where possible
- PLATFORM: PC (Low), Web (Demo)

**SCENARIO: SVG Rendering Stress**
- GIVEN: All 6 biome SVG linework layers active with gentle parallax
- WHEN: Camera moves across worst-case view covering all biomes
- THEN: Frame rate stays above minimum (30 FPS target)
- AND: No visual artifacts or hitching from SVG rendering
- PLATFORM: PC (Low), Web (Demo)

**SCENARIO: Plant Growth + Audio Accumulation**
- GIVEN: Player has planted multiple song-seeds (up to 12), voices accumulating in the score
- WHEN: Matured plants are active with audio voices, terrain shaping effects
- THEN: Frame rate stays above minimum; voice budget ≤16 simultaneous
- PLATFORM: PC (Low), Web (Demo)

### Memory Tests

**SCENARIO: Extended Play Session**
- GIVEN: Game running for 30 minutes with normal gameplay patterns
- WHEN: Player walks through biomes, plants seeds, triggers puzzles
- THEN: Memory usage remains stable (no linear growth)
- AND: No memory leaks detected across biome transitions
- AND: GC pauses < 16ms (Godot default)
- PLATFORM: PC (Low), Web (Demo)

**SCENARIO: Biome Transition**
- GIVEN: Player completes one biome and transitions to the next
- WHEN: Scene transitions between all 6 biomes
- THEN: Previous level fully unloaded
- AND: Memory baseline returns (within ±5%)
- AND: No cumulative memory growth across transitions
- PLATFORM: PC (Low), Web (Demo)

### Loading Time Tests

**SCENARIO: Cold Boot**
- GIVEN: Game not in memory (fresh launch)
- WHEN: Launching from platform UI
- THEN: Interactive menu (main walk area) in < 5s
- AND: Loading progress visible
- AND: Audio engine initializes without delay blocking gameplay
- PLATFORM: PC, Web

**SCENARIO: Biome Load**
- GIVEN: Player at end of one biome, approaching gate to next
- WHEN: Transitioning to next biome/area
- THEN: Load completes in < 3s
- AND: No streaming seams or audible gaps in score
- PLATFORM: PC, Web

---

## Methodology

### Automated Tests (Godot GDScript)

```gdscript
# Performance: Entity stress test (adapted for audio voice budget)
func test_performance_voice_budget():
    var frame_times = []
    var voice_count = 0
    
    # Start with 0 voices, gradually increase to 16
    for voice in range(17):
        # Generate a procedural voice voice_layer
        var voice_node = VoiceLayer.instantiate()
        add_child(voice_node)
        voice_count += 1
    
    # Run 10-minute walk simulation (3000 frames at 60 FPS)
    for i in range(3000):
        await get_tree().process_frame
        frame_times.append(Performance.get_monitor(Performance.TIME_PROCESS))
    
    # Calculate metrics
    var avg_frame_time = frame_times.reduce(func(a, b): return a + b) / frame_times.size()
    var p95_frame_time = calculate_percentile(frame_times, 0.95)
    
    # Thresholds: 33ms = 30 FPS, 16.6ms = 60 FPS
    assert_lt(avg_frame_time, 0.05, "Average frame time under 50ms (20 FPS minimum)")
    assert_lt(p95_frame_time, 0.033, "P95 frame time under 33ms (30 FPS target)")
```

```gdscript
# Performance: SVG rendering stress test
func test_performance_svg_rendering():
    var frame_times = []
    
    # Activate all 6 biome layers with parallax
    for i in range(6):
        var biome = BiomeLayer.instantiate()
        biome.active_layers = ALL_LAYERS
        add_child(biome)
    
    # Walk across full area for 5 minutes
    for i in range(300):
        await get_tree().process_frame
        frame_times.append(Performance.get_monitor(Performance.TIME_PROCESS))
    
    var avg_frame_time = frame_times.reduce(func(a, b): return a + b) / frame_times.size()
    assert_lt(avg_frame_time, 0.033, "Average frame time under 33ms (30 FPS) with all SVG layers")
```

### Manual Profiling Checklists

**CPU Profiling (Godot Profiler / PIX)**
- [ ] Identify hotspots in process() and _physics_process()
- [ ] Check audio thread CPU usage (AudioServer.get_busy_ratio())
- [ ] Verify main thread frame time budget (16.6ms for 60 FPS, 33.3ms for 30 FPS)
- [ ] Check Godot server processing time vs rendering time

**GPU Profiling (RenderDoc)**
- [ ] Draw call count at target scenes (all 6 biomes active)
- [ ] Overdraw analysis on complex SVG areas
- [ ] Shader complexity assessment (2D shader uniform updates)
- [ ] GPU memory bandwidth usage

**Memory Profiling (Godot Monitors / Heapdump)**
- [ ] Heap allocation patterns over 30-minute session
- [ ] Asset memory usage by category (SVG textures, audio voices, scripts)
- [ ] Leak detection across multiple level loads
- [ ] Peak allocation tracking during voice accumulation

### Tools

| Platform | CPU Profiler | GPU Profiler | Memory |
|----------|-------------|-------------|--------|
| Godot (PC) | Godot Profiler, OS profiler | RenderDoc | Godot Monitors, heapdump |
| Web (Browser) | Chrome DevTools Performance | Chrome DevTools | Chrome Task Manager, heapdump |

### Profiling Checklist

**CPU**
- [ ] Main thread frame time
- [ ] Audio thread utilization
- [ ] Godot server processing
- [ ] GC frequency and duration (if applicable)

**GPU**
- [ ] Draw call count
- [ ] Overdraw ratio (2D SVG layers)
- [ ] Shader uniform update frequency

**Memory**
- [ ] Peak allocation during voice accumulation (16 voices)
- [ ] Leak detection over extended session
- [ ] Asset memory breakdown (SVG, audio, scripts)

---

## Benchmark Suite

### Benchmark Levels

| Name | Purpose | Duration | Key Metrics |
|------|---------|----------|-------------|
| Voice Budget Stress | 16 simultaneous generated voices, 10-min walk simulation | 60s (simulated) | FPS avg/min, voice count, audio dropouts |
| SVG Rendering | All 6 biome layers with parallax active | 60s | FPS avg/min, draw calls, overdraw |
| Load Time Cold Boot | Fresh launch to first playable frame | 10s | Load time to interactive |
| Biome Transition | Transition between adjacent biomes | 15s | Load time, memory baseline return |
| Plant Accumulation | Growing seeds, accumulating voices up to 16 | 60s | FPS, voice budget, memory stability |

### Baseline Metrics (to be captured on reference hardware)

| Benchmark | Platform | FPS (Avg) | FPS (1% Low) | Memory (Peak) | Date |
|-----------|----------|-----------|--------------|---------------|------|
| Voice Budget Stress | PC (Low) | | | | |
| SVG Rendering | PC (Low) | | | | |
| Load Time Cold Boot | PC | | | | |
| Biome Transition | PC | | | | |
| Plant Accumulation | PC (Low) | | | | |

### Regression Criteria

| Metric | Warning Threshold | Failure Threshold |
|--------|-------------------|-------------------|
| FPS Average | -5% from baseline | -10% from baseline |
| FPS 1% Low | -10% from baseline | -15% from baseline |
| Memory Peak | +5% from baseline | +10% from baseline |
| Load Time | +1s from baseline | +2s from baseline |
| Voice Count | +1 from budget | +2 from budget (≤16 max) |

### CI Integration

Performance tests run on nightly builds and pre-release gates. Fails the build if:
- FPS average degrades >5% from baseline
- Memory peak increases >10% from baseline
- Load time increases >2s from baseline
- Voice count exceeds 16 simultaneous

---

## Platform Matrix

### PC (Steam) — Target: 60 FPS on low-spec laptops (integrated graphics)

**Hardware reference**: Laptop with Intel UHD Graphics or AMD Radeon integrated graphics, 8GB RAM, i5/i7 class CPU

- Test quality settings: Low (disable shadows, minimal effects), Medium, High
- Test resolutions: 1280×720, 1920×1080
- Audio: Verify ≤16 simultaneous generated voices with no dropouts
- Web export: Verify HTML5 build size ≤150 MB, load time ≤5s

**Quality presets**:
- Low: Reduced voice budget (12 voices max), simpler shaders, no post-processing
- Medium: Full voice budget (16 voices), basic shading
- High: Full voice budget, optional visual enhancements (if within FPS budget)

### Web (Demo) — Target: ≤150 MB, ≤5s load, 30 FPS minimum

**Browser autoplay policy**: Audio must init on first user gesture

- Godot web export settings: Compress textures, disable unnecessary features
- Audio: Pre-bake minimal bed sound, generate remaining voices procedurally
- Size budget: SVG assets compressed, no unnecessary resources
- Load time: Critical path must complete in ≤5s; use asynchronous loading for non-essential assets

**Build size control**:
- Disable 3D features (2D only game)
- Disable unused Godot modules
- Compress audio to OGG Vorbis at lower bitrate for web
- Use SVG sprite sheets instead of individual image files
- Minimize editor resources in export preset

---

## Regression Criteria

| Metric | Warning | Failure |
|--------|---------|---------|
| FPS Average | -5% from baseline | -10% from baseline |
| FPS 1% Low | -10% from baseline | -15% from baseline |
| Memory Peak | +5% from baseline | +10% from baseline |
| Load Time (cold boot) | +1s from baseline | +2s from baseline |
| Load Time (biome transition) | +500ms from baseline | +1s from baseline |
| Voice Count | 15/16 voices with minor stutter | 17+ voices or audible dropouts |
| Web export size | +10 MB from baseline | +20 MB from baseline or >150 MB |

**CI gate configuration**:
- Nightly: Run full benchmark suite; flag warnings but don't fail
- Pre-release: Fail build if any threshold is "Failure"
- Per-commit: Run quick voice budget and load time tests; fail on clear regressions

---

## Schedule

| Activity | Frequency | Owner |
|----------|-----------|-------|
| Benchmark run | Nightly (automated) | CI |
| Regression review | Weekly | Tech Lead |
| Deep profiling | Milestone (after E1, E4, E5) | Performance Engineer |
| Platform soak test | Monthly | QA |
| Pre-release gate | Before each release | Tech Lead |

**Key ownership**:
- **Performance thresholds**: Tech Lead owns regression calls
- **Baseline updates**: Updated after major milestones (E1 prototype, E4 seed+shaping, E5 full trail)
- **Platform-specific issues**: QA owns platform testing and documentation

---

## Notes

- **Audio-performance coupling**: The generative audio system is the primary performance concern. Each additional voice consumes CPU cycles for real-time synthesis. The 16-voice budget is hard-constrained; exceeding it causes audio stutter and potential frame drops.
- **SVG rendering**: 2D SVG linework is lightweight, but all 6 biomes active with parallax may draw additional calls. Profile with all layers active.
- **Web export particularities**: Browser autoplay policy means background audio must wait for user gesture. The living score's "bed" (wind/ambience) should be designed to start after first interaction.
- **Low-spec target**: Integrated graphics from 2018-2022 era laptops. 60 FPS is the target but 30 FPS minimum is acceptable with scaled settings.
- **No networking**: Single-player only simplifies networking performance but means all content must fit in one session.