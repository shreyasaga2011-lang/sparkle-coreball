extends Node
@onready var cash: Label = $PanelContainer/VBoxContainer/Cash



var kills = 0

func add_kill():
	kills += 1

var currentMoney = 100000

func add_money():
	currentMoney += 30
func buyStuffExplodingBullets():
	if currentMoney >= 1000:
		currentMoney -= 1000
	else:
		cash.notEnoughMoney()
var buyFireRateUpgradeCost = 100
func buyFireRateUpgrade():
	currentMoney -= buyFireRateUpgradeCost
	buyFireRateUpgradeCost *= 1.3
	buyFireRateUpgradeCost = snapped(buyFireRateUpgradeCost, 1)

func buyHealth():
	currentMoney -= 100


func buyForceField():
	currentMoney -= 1000

var buyMoveSpeedUpgradeCost = 100

func buyMoveSpeedUpgrade():
	currentMoney -= buyMoveSpeedUpgradeCost
	buyMoveSpeedUpgradeCost *= 1.3
	buyMoveSpeedUpgradeCost = snapped(buyMoveSpeedUpgradeCost, 1) 
func buyShuriken():
	currentMoney -= 700

func buyForceBlast():
	currentMoney -= 1000
