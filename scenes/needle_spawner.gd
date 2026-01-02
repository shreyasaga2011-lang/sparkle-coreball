extends Node2D
@export var needle: PackedScene

var current_pin = true

func _on_pin_resolved():
	current_pin = null

func spawnPin():
	if current_pin != null:
		return

	current_pin = needle.instantiate()
	current_pin.global_position = global_position
	get_tree().current_scene.add_child(current_pin)
	current_pin.pin_resolved.connect(_on_pin_resolved)
	
func _input(event):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			spawnPin()
