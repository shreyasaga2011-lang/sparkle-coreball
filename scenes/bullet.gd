extends Area2D
const  speed = 2
var direction: Vector2
func _physics_process(delta: float) -> void:
	global_position += direction * speed
