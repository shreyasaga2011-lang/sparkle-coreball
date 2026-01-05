extends Area2D
var health = 2
@onready var kill_tracker: Label = $Camera2D/KillTracker

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullets"):
		healthTick()
		
func healthTick():
	health -= 1
	if(health == 0):
		queue_free()
		KillTracker.upper()
