extends Area2D

var speed := 900.0
var moving := true

func _process(delta):
	if moving:
		position.y -= speed * delta


func _on_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
