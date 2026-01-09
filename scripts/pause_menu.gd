extends Control
@onready var resume_button: Button = $PanelContainer/ResumeButton
@onready var upgrade_firerate: Button = $PanelContainer/VBoxContainer/UpgradeFirerate
@onready var exploding_bullets: Button = $PanelContainer/VBoxContainer/ExplodingBullets


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
	


var currentCostFireRate = 115
var fireUpgradeCount = 0
func _on_upgrade_firerate_pressed() -> void:
	if fireUpgradeCount < 6:
		fireUpgradeCount += 1
		if currentCostFireRate <= 1:
			currentCostFireRate *= 1.3
	if currentCostFireRate <= KillTrackerNode.currentMoney:
		upgrade_firerate.text = "Upgrade Firerate  Cost: " + str(currentCostFireRate) + " (Current upgrades: "  + str(fireUpgradeCount) + ")"
		currentCostFireRate = snapped(currentCostFireRate, 1) 
		KillTrackerNode.buyFireRateUpgrade()
		upgrades.upFirerate()
	elif currentCostFireRate > KillTrackerNode.currentMoney:
		pass
	else:
		upgrade_firerate.text = "Upgrade Firerate (current upgrades: MAX)"



var exploBool = false
var permExpoBool = false
func _on_exploding_bullets_pressed() -> void:

	if exploBool == true:
		exploBool = false
	else:
		exploBool = true
	if KillTrackerNode.currentMoney >= 1000 && permExpoBool != true:
		KillTrackerNode.buyStuffExplodingBullets()
		exploBool = true
		permExpoBool = true
	if exploBool == true:
		exploding_bullets.text = "Explosion Shot EQUIPED"
	else:
		exploding_bullets.text = "Explosion Shot"
	if permExpoBool == true:
		upgrades.explosionUpgrade()
