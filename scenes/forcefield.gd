extends Area2D

func _ready() -> void:
	visible = false


func _physics_process(delta: float) -> void:
	if upgrades.forcefieldBool == true:
		visible = true
		add_to_group("forcefield")
