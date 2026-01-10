extends Label

func _process(_delta: float) -> void:
	if not upgrades.shurikenBool:
		text = "Shuriken LOCKED"
		return

	if upgrades.cooldown_timer == null:
		text = "Shuriken: READY"
		return

	text = "Shuriken: " + str(snapped(upgrades.cooldown_timer.time_left, 0.1)) + "s"
