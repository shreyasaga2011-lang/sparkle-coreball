extends Area2D

@export var pierce := 2
var counter := 0
@export var speed := 600.0
var direction := Vector2.ZERO

func _physics_process(delta):
	global_position += direction * speed * delta

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		counter += 1
		if counter >= pierce:
			queue_free()
