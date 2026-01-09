extends Node
@onready var cash: Label = $PanelContainer/VBoxContainer/Cash



var kills = 0

func add_kill():
	kills += 1

var currentMoney = 1000

func add_money():
	currentMoney += 10
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
