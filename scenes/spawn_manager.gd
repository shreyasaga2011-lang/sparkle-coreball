extends Node2D
@export var enemy_scene_two: PackedScene
@export var enemy_scene: PackedScene
@export var spawn_radius := 2000
@onready var timer: Timer = $Timer
@onready var player = get_tree().get_first_node_in_group("player")
@onready var enemy_container = self 
@onready var wave_count: Label = $CanvasLayer/WaveCount

var current_phase := 0
var phase_time := 0.0

func _ready() -> void:
	WaveTick.waveTickGlobal()
	timer.wait_time = 0.4
	timer.timeout.connect(spawn_enemy)
	timer.start()

	await get_tree().create_timer(20.0).timeout
	timer.stop()

	WaveTick.waveTickGlobal()
	timer.wait_time = 0.3
	timer.timeout.connect(spawn_enemy_two)
	timer.start()
	
	await get_tree().create_timer(20.0).timeout
	timer.stop()
	
func spawn_enemy():

	if not is_instance_valid(player):
		print("asd")
		return

	var angle = randf() * TAU
	var distance = sqrt(randf()) * spawn_radius + 300       
	var offset = Vector2(cos(angle), sin(angle)) * distance
	var pos = player.global_position + offset

	var enemy = enemy_scene.instantiate()

	enemy_container.add_child(enemy)
	enemy.global_position = pos

func spawn_enemy_two():
	if not is_instance_valid(player):
		print("asd")
		return

	var angle = randf() * TAU
	var distance = sqrt(randf()) * spawn_radius + 300       
	var offset = Vector2(cos(angle), sin(angle)) * distance
	var pos = player.global_position + offset

	var enemy = enemy_scene_two.instantiate()

	enemy_container.add_child(enemy)
	enemy.global_position = pos
