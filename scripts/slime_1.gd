extends Area2D
var health = 2
@onready var kill_tracker: Label = get_tree().get_first_node_in_group("kill_tracker")

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullets"):
		healthTick()
		
func healthTick():
	health -= 1
	if(health == 0):
		kill_tracker.upper()
		queue_free()
