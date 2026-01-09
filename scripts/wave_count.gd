extends Label



func _physics_process(delta: float) -> void:
	text = "Wave: " + str(WaveTick.currentWaves)
