extends Control
@onready var resume_button: Button = $PanelContainer/ResumeButton
@onready var upgrade_firerate: Button = $PanelContainer/VBoxContainer/UpgradeFirerate


func resume():
	$AnimationPlayer.play_backwards("blur")
	await $AnimationPlayer.animation_finished
	get_tree().paused = false
	hide()
	

	
func pause():
	show()
	get_tree().paused = true
	$AnimationPlayer.play("blur")

func testEsc():
	if Input.is_action_just_pressed("esc") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused:
		resume()

func _on_resume_pressed() -> void:
	resume()

func _process(delta):
	testEsc()
	



var fireUpgradeCount = 0
func _on_upgrade_firerate_pressed() -> void:
	if fireUpgradeCount < 6:
		fireUpgradeCount += 1
		upgrades.upFirerate()
		upgrade_firerate.text = "Upgrade Firerate (current upgrades: " + str(fireUpgradeCount) + ")"
	else:
		upgrade_firerate.text = "Upgrade Firerate (current upgrades: MAX)"
