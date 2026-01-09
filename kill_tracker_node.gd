extends Node
var kills = 0

func add_kill():
	kills += 1

var currentMoney = 1000

func add_money():
	currentMoney += 1

func buyStuffExplodingBullets():
	if currentMoney >= 1000:
		currentMoney -= 1000
	else:
		return
var buyFireRateUpgradeCost = 100
func buyFireRateUpgrade():
	currentMoney -= buyFireRateUpgradeCost
	buyFireRateUpgradeCost *= 1.3
	buyFireRateUpgradeCost = snapped(buyFireRateUpgradeCost, 1) 
