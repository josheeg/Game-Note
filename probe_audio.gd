extends SceneTree

## Temporary probe: does the triad actually fire in the live scene?
##
## The unit tests cover what the tones are. This covers the wiring - that main
## reaches the Sfx node, that each of the three moments calls play(), and that
## the players exist and hold a real stream. A scene that loads cleanly but
## never makes a sound is the failure this catches.

var _counts := {0: 0, 1: 0, 2: 0}


func _init() -> void:
	var scene: PackedScene = load("res://scenes/main.tscn")
	var main := scene.instantiate()
	root.add_child(main)
	await process_frame
	await process_frame

	if main.sfx == null:
		print("RESULT ABORT no Sfx node in the scene")
		quit()
		return
	print("RESULT sfxNode=", main.sfx.get_class(),
		" script=", main.sfx.get_script().resource_path.get_file())

	var names := ["paddle", "wall", "brick"]
	for child in main.sfx.get_children():
		var player := child as AudioStreamPlayer
		if player == null:
			continue
		var stream := player.stream
		var samples: int = stream.data.size() if stream != null else 0
		print("RESULT player=", player.name, " hasStream=", stream != null,
			" samples=", samples, " format8bit=", stream.format == AudioStreamWAV.FORMAT_8_BITS)
		var index: int = names.find(String(player.name).to_lower())
		if index >= 0:
			_counts[index] = 0

	# Instrument play() so the counts reflect real calls coming from main.
	var original := Callable(main.sfx, "play")
	main.sfx.play = func(kind: int) -> void:
		_counts[kind] = _counts.get(kind, 0) + 1
		original.call(kind)

	main.state.lives = 99

	var wall_before: int = _counts[1]
	main.ball.position = Vector2(319.0, 120.0)
	main.ball.velocity = Vector2(400.0, 0.0)
	main._check_bounds()
	print("RESULT wallSounds=", _counts[1] - wall_before)

	var paddle_before: int = _counts[0]
	main.ball.position = Vector2(160.0, 226.0)
	main.ball.velocity = Vector2(0.0, 400.0)
	main._check_paddle()
	print("RESULT paddleSounds=", _counts[0] - paddle_before)

	var brick_before: int = _counts[2]
	main.ball.position = Vector2(0.0, 0.0)
	main._check_bricks()
	print("RESULT brickSounds=", _counts[2] - brick_before)

	# A frame where nothing is touched must stay silent.
	var quiet: Array = [_counts[0], _counts[1], _counts[2]]
	main.ball.position = Vector2(160.0, 200.0)
	main.ball.velocity = Vector2(0.0, 0.0)
	main._check_bounds()
	main._check_paddle()
	main._check_bricks()
	var silent: bool = _counts[0] == quiet[0] and _counts[1] == quiet[1] and _counts[2] == quiet[2]
	print("RESULT silentWhenNothingTouched=", silent)
	quit()
