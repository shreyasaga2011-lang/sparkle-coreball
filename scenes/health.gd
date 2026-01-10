extends Label


var currentHealth = 5


func _physics_process(delta: float) -> void:
	text = "Health: " + str(upgrades.currentHealth)
