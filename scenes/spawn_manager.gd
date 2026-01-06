extends Node2D

@export var enemy_scene: PackedScene
@export var spawn_radius := 2000
@onready var timer: Timer = $Timer
@onready var player = get_tree().get_first_node_in_group("player")


@onready var enemy_container = self 

func _ready() -> void:
	timer.wait_time = 0.33
	timer.timeout.connect(spawn_enemy)
	timer.start()
	

func spawn_enemy():

	if not is_instance_valid(player):
		print("asd")
		return

	var angle = randf() * TAU
	var distance = sqrt(randf()) * spawn_radius + 120       
	var offset = Vector2(cos(angle), sin(angle)) * distance
	var pos = player.global_position + offset

	var enemy = enemy_scene.instantiate()
	

	enemy_container.add_child(enemy)
	enemy.global_position = pos
