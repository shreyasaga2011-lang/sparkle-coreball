extends Area2D
@onready var player: CharacterBody2D = $".."

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		player.healthTick()
