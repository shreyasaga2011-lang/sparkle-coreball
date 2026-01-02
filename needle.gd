extends Area2D

signal pin_resolved

enum PinState { IDLE, FLYING, ATTACHED }
var state := PinState.IDLE

var speed := 900.0

# Preload the needle scene directly
var needle_scene = preload("res://scenes/needle.tscn")

func _physics_process(delta: float) -> void:
	if state == PinState.IDLE and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		state = PinState.FLYING

	if state == PinState.FLYING:
		position.y -= speed * delta

func _on_area_entered(area: Area2D) -> void:
	if state == PinState.FLYING:
		state = PinState.ATTACHED
		emit_signal("pin_resolved")

		var new_needle = needle_scene.instantiate()
		new_needle.global_position = global_position
		get_tree().current_scene.add_child(new_needle)
		new_needle.pin_resolved.connect(_on_pin_resolved)

func _on_pin_resolved():
	pass
