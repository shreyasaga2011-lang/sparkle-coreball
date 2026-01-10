extends Area2D

@export var speed := 600.0
var direction := Vector2.ZERO
var size_multiplier: float = 1.0
func _ready() -> void:
	if size_multiplier != 1.0:
		scale = Vector2(size_multiplier, size_multiplier)
	var player = get_tree().get_first_node_in_group("player")
	if player:
		direction = (player.global_position - global_position).normalized()
		look_at(player.global_position)
func _physics_process(delta):
	global_position += direction * speed * delta

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		queue_free()
