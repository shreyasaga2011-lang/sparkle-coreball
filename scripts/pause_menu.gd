extends Control
@onready var resume_button: Button = $PanelContainer/ResumeButton
@onready var upgrade_firerate: Button = $PanelContainer/VBoxContainer/UpgradeFirerate
@onready var exploding_bullets: Button = $PanelContainer/VBoxContainer/ExplodingBullets
@onready var buy_health: Button = $PanelContainer/VBoxContainer/BuyHealth
@onready var forcefield: Button = $PanelContainer/VBoxContainer/Forcefield

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
	if fireUpgradeCount <= 7:
		if currentCostFireRate <= KillTrackerNode.currentMoney:
			if currentCostFireRate >= 1:
				currentCostFireRate *= 1.3
				fireUpgradeCount += 1
				upgrade_firerate.text = "Upgrade Firerate  Cost: " + str(currentCostFireRate) + " (Current upgrades: "  + str(fireUpgradeCount) + ")"
				currentCostFireRate = snapped(currentCostFireRate, 1) 
				KillTrackerNode.buyFireRateUpgrade()
				upgrades.upFirerate()
	if fireUpgradeCount >= 7:
		upgrade_firerate.text = "Upgrade Firerate (current upgrades: MAX)"

var exploBool = false
var permExpoBool = false
var counter = 0
func _on_exploding_bullets_pressed() -> void:
	if exploBool == true && permExpoBool == true:
		exploBool = false
	elif permExpoBool == true:
		exploBool = true
	if KillTrackerNode.currentMoney >= 1000 && permExpoBool != true:
		KillTrackerNode.buyStuffExplodingBullets()
		exploBool = true
		permExpoBool = true
	if exploBool == true:
		exploding_bullets.text = "Explosion Shot EQUIPED"
	elif permExpoBool == true:
		exploding_bullets.text = "Explosion Shot"
	else:
		exploding_bullets.text = "Explosion Shot (Cost: 1000)"
	if permExpoBool == true:
		upgrades.explosionUpgrade()



func _on_buy_health_pressed() -> void:
	if KillTrackerNode.currentMoney <= 100:
		pass
	else:
		upgrades.healthAdd()
		KillTrackerNode.buyHealth()




func _on_forcefield_pressed() -> void:
	if KillTrackerNode.currentMoney <= 1000:
		pass
	else:
		upgrades.buyForceField()
		KillTrackerNode.buyForceField()
		forcefield.text = "Forcefield EQUIPPED"
		

var currentCostMoveSpeed = 120
var moveSpeedUpgradeCount = 0

func _on_move_speed_increase_pressed() -> void:
	if moveSpeedUpgradeCount <= 7:
		if currentCostMoveSpeed <= KillTrackerNode.currentMoney:
			if currentCostMoveSpeed >= 1:
				currentCostMoveSpeed *= 1.3
				moveSpeedUpgradeCount += 1
				$PanelContainer/VBoxContainer/MoveSpeedIncrease.text = \
				"Upgrade Move Speed  Cost: " + str(currentCostMoveSpeed) + \
				" (Current upgrades: " + str(moveSpeedUpgradeCount) + ")"
				currentCostMoveSpeed = snapped(currentCostMoveSpeed, 1)
				KillTrackerNode.buyMoveSpeedUpgrade()
				upgrades.upMoveSpeed()


	if moveSpeedUpgradeCount >= 7:
		$PanelContainer/VBoxContainer/MoveSpeedIncrease.text = \
			"Upgrade Move Speed (current upgrades: MAX)"


@onready var shuriken: Button = $PanelContainer/VBoxContainer/Shuriken

var permShuriken = false

func _on_shuriken_pressed() -> void:
	if permShuriken == false:
		if KillTrackerNode.currentMoney >= 1000:
			KillTrackerNode.buyShuriken()
			upgrades.buyShuriken()
			permShuriken = true
			shuriken.text = "Shuriken EQUIPPED (q or RMB)"
			

var permForceBlast = false

@onready var force_blast: Button = $PanelContainer/VBoxContainer/ForceBlast

func _on_force_blast_pressed() -> void:
	if permForceBlast == false:
		if KillTrackerNode.currentMoney >= 1000:
			KillTrackerNode.buyForceBlast()
			upgrades.buyForceBlast()
			permForceBlast = true
			force_blast.text = "ForceBlast EQUIPPED (AUTO Fires Whenever Damage Received)"
