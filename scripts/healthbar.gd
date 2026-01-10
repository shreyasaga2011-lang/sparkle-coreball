extends Label

func _process(delta: float) -> void:
	text = "HEALTH: " + str(health)

var health = 150
func healthTickBar():
	health -= 1
