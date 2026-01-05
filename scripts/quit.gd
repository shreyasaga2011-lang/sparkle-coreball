extends Button

func _process(delta: float) -> void:
	if(button_pressed):
		get_tree().quit()
