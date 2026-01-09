extends Label

@onready var cash: Label = $"."


func _process(delta: float) -> void:
	cash.text = "Money: " + str(KillTrackerNode.currentMoney)
