extends Label

var kills = 0

func upper():
	kills += 1

func _physics_process(delta: float) -> void:
	text = "Points: " + str(kills)
