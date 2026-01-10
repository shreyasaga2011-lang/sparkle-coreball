extends Label

@onready var cash: Label = $"."


func _process(delta: float) -> void:
	cash.text = "Health: " + str(upgrades.currentHealth)
