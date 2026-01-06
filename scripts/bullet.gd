extends Area2D

@export var pierce := 2
var counter := 0
@export var speed := 600.0
var direction := Vector2.ZERO
var size_multiplier: float = 1.0
func _ready() -> void:
	if size_multiplier != 1.0:
		scale = Vector2(size_multiplier, size_multiplier)
func _physics_process(delta):
	global_position += direction * speed * delta

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		counter += 1
		if counter >= pierce:
			queue_free()
