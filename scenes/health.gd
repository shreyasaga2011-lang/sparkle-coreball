extends Label


var currentHealth = 5

func healthAdd():
	currentHealth += 1

func healthTickHealth():
	currentHealth -= 1 

func _physics_process(delta: float) -> void:
	text = "Health: " + str(currentHealth)
