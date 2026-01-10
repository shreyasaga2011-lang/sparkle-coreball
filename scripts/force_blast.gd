extends Area2D

@onready var anim: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	visible = false


func _physics_process(delta: float) -> void:
	if upgrades.forceBlast == true:
		visible = true

func blast():
	add_to_group("forceblast")
	anim.play("forceblastAnim")
	await get_tree().create_timer(0.7).timeout
	visible = false
	remove_from_group("forceblast")
