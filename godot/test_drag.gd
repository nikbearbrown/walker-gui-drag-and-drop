extends SceneTree

var failures := 0
var checks := 0

func _initialize() -> void:
	call_deferred("run")

func check(ok: bool, label: String) -> void:
	checks += 1
	if not ok:
		failures += 1
	print("PASS " if ok else "FAIL ", label)

func mouse(pos: Vector2, pressed: bool) -> void:
	var e := InputEventMouseButton.new()
	e.position = pos
	e.global_position = pos
	e.button_index = MOUSE_BUTTON_LEFT
	e.pressed = pressed
	e.button_mask = MOUSE_BUTTON_MASK_LEFT if pressed else 0
	# Positions are viewport-local canvas coordinates, not window pixels.
	root.push_input(e, true)
	await process_frame

func motion(pos: Vector2, delta: Vector2) -> void:
	var e := InputEventMouseMotion.new()
	e.position = pos
	e.global_position = pos
	e.relative = delta
	e.button_mask = MOUSE_BUTTON_MASK_LEFT
	root.push_input(e, true)
	await process_frame

func run() -> void:
	root.size = Vector2i(1024, 600)
	var scene: Node = load("res://drag_and_drop.tscn").instantiate()
	root.add_child(scene)
	await process_frame
	await process_frame
	var buttons := scene.get_node("GridContainer").get_children()
	print("GEOMETRY root=", root.size, " scene=", scene.size)
	for b in buttons:
		print(b.name, " ", b.get_global_rect())
		b.gui_input.connect(func(event: InputEvent): print("GUI ", b.name, " ", event.as_text()))
	check(buttons.size() == 9, "nine color buttons")
	for pair in [[0, 8], [4, 2], [6, 1]]:
		var source: ColorPickerButton = buttons[pair[0]]
		var target: ColorPickerButton = buttons[pair[1]]
		var original := source.color
		var start := source.get_global_rect().get_center()
		var finish := target.get_global_rect().get_center()
		await motion(start, Vector2.ZERO)
		await mouse(start, true)
		await motion(start + Vector2(25, 0), Vector2(25, 0))
		check(root.gui_is_dragging(), "input starts drag")
		await motion(finish, finish - start - Vector2(25, 0))
		await mouse(finish, false)
		check(target.color == original, "drop copies source color")
		check(source.color == original, "source color retained")
		check(not root.gui_is_dragging(), "release ends drag")
	var colors: Array = buttons.map(func(b): return b.color)
	var start: Vector2 = buttons[3].get_global_rect().get_center()
	await motion(start, Vector2.ZERO)
	await mouse(start, true)
	await motion(start + Vector2(25, 0), Vector2(25, 0))
	check(root.gui_is_dragging(), "empty-space test starts drag")
	await motion(Vector2(20, 20), Vector2(20, 20) - start)
	await mouse(Vector2(20, 20), false)
	check(not root.gui_is_dragging(), "empty-space release ends drag")
	check(buttons.map(func(b): return b.color) == colors, "empty-space drop preserves colors")
	scene.queue_free()
	await process_frame
	print("RESULT ", checks, " checks, ", failures, " failures; synthetic headless input only")
	quit(1 if failures else 0)
