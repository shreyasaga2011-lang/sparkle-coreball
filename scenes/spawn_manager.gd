extends Node2D
@export var enemy_scene_six: PackedScene
@export var enemy_scene_five: PackedScene
@export var enemy_scene_four: PackedScene
@export var enemy_scene_three: PackedScene
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

	await get_tree().create_timer(40.0).timeout
	timer.stop()

	WaveTick.waveTickGlobal()
	timer.wait_time = 0.6
	timer.timeout.connect(spawn_enemy_two)
	timer.start()
	
	await get_tree().create_timer(50.0).timeout
	timer.stop()
	
	WaveTick.waveTickGlobal()
	timer.wait_time = 0.65
	timer.timeout.connect(spawn_enemy_three)
	timer.start()
	
	await get_tree().create_timer(50.0).timeout
	timer.stop()
	
	WaveTick.waveTickGlobal()
	timer.wait_time = 0.75
	timer.timeout.connect(spawn_enemy)
	timer.timeout.connect(spawn_enemy_two)
	timer.timeout.connect(spawn_enemy_three)
	timer.start()
	await get_tree().create_timer(50.0).timeout
	timer.stop()
	
	WaveTick.waveTickGlobal()
	timer.wait_time = 0.85
	timer.timeout.connect(spawn_enemy)
	timer.timeout.connect(spawn_enemy_two)
	timer.timeout.connect(spawn_enemy_four)
	timer.timeout.connect(spawn_enemy_three)
	spawn_enemy_five()
	timer.start()
	await get_tree().create_timer(50.0).timeout
	timer.stop()
	
	WaveTick.waveTickGlobal()
	timer.wait_time = 1.4
	timer.timeout.connect(spawn_enemy)
	timer.timeout.connect(spawn_enemy_two)
	timer.timeout.connect(spawn_enemy_four)
	timer.timeout.connect(spawn_enemy_three)
	timer.timeout.connect(spawn_enemy_six)
	timer.timeout.connect(spawn_enemy_six)
	spawn_enemy_five()
	timer.start()
	await get_tree().create_timer(50.0).timeout
	timer.stop()
	
	WaveTick.waveTickGlobal()
	timer.wait_time = 0.5
	timer.timeout.connect(spawn_enemy_four)
	timer.timeout.connect(spawn_enemy_three)
	timer.timeout.connect(spawn_enemy_six)
	timer.timeout.connect(spawn_enemy_six)
	spawn_enemy_five()
	timer.start()
	await get_tree().create_timer(50.0).timeout
	timer.stop()
	
	
	WaveTick.waveTickGlobal()
	timer.wait_time = 0.2
	timer.timeout.connect(spawn_enemy_four)
	timer.timeout.connect(spawn_enemy_three)
	timer.timeout.connect(spawn_enemy_six)
	timer.timeout.connect(spawn_enemy_seven)
	timer.timeout.connect(spawn_enemy_eight)
	timer.timeout.connect(spawn_enemy_nine)
	timer.timeout.connect(spawn_enemy_ten)
	spawn_enemy_five()
	timer.start()

	
	
func spawn_enemy():

	if not is_instance_valid(player):
		print("asd")
		return

	var angle = randf() * TAU
	var distance = sqrt(randf()) * spawn_radius + 1000
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
	var distance = sqrt(randf()) * spawn_radius + 1000       
	var offset = Vector2(cos(angle), sin(angle)) * distance
	var pos = player.global_position + offset

	var enemy = enemy_scene_two.instantiate()

	enemy_container.add_child(enemy)
	enemy.global_position = pos


func spawn_enemy_three():
	if not is_instance_valid(player):
		print("asd")
		return

	var angle = randf() * TAU
	var distance = sqrt(randf()) * spawn_radius + 1000       
	var offset = Vector2(cos(angle), sin(angle)) * distance
	var pos = player.global_position + offset

	var enemy = enemy_scene_three.instantiate()

	enemy_container.add_child(enemy)
	enemy.global_position = pos


func spawn_enemy_four():
	if not is_instance_valid(player):
		print("asd")
		return

	var angle = randf() * TAU
	var distance = sqrt(randf()) * spawn_radius + 1000       
	var offset = Vector2(cos(angle), sin(angle)) * distance
	var pos = player.global_position + offset

	var enemy = enemy_scene_four.instantiate()

	enemy_container.add_child(enemy)
	enemy.global_position = pos
	
func spawn_enemy_five():
	if not is_instance_valid(player):
		print("asd")
		return

	var angle = randf() * TAU
	var distance = sqrt(randf()) * spawn_radius + 1000       
	var offset = Vector2(cos(angle), sin(angle)) * distance
	var pos = player.global_position + offset

	var enemy = enemy_scene_five.instantiate()

	enemy_container.add_child(enemy)
	enemy.global_position = pos


func spawn_enemy_six():
	if not is_instance_valid(player):
		print("asd")
		return

	var angle = randf() * TAU
	var distance = sqrt(randf()) * spawn_radius + 1000       
	var offset = Vector2(cos(angle), sin(angle)) * distance
	var pos = player.global_position + offset

	var enemy = enemy_scene_six.instantiate()

	enemy_container.add_child(enemy)
	enemy.global_position = pos

func spawn_enemy_seven():
	if not is_instance_valid(player):
		print("asd")
		return

	var angle = randf() * TAU
	var distance = sqrt(randf()) * spawn_radius + 1000       
	var offset = Vector2(cos(angle), sin(angle)) * distance
	var pos = player.global_position + offset

	var enemy = enemy_scene_six.instantiate()

	enemy_container.add_child(enemy)
	enemy.global_position = pos
	
	
	
	
	
func spawn_enemy_eight():
	if not is_instance_valid(player):
		print("asd")
		return

	var angle = randf() * TAU
	var distance = sqrt(randf()) * spawn_radius + 1000       
	var offset = Vector2(cos(angle), sin(angle)) * distance
	var pos = player.global_position + offset

	var enemy = enemy_scene_six.instantiate()

	enemy_container.add_child(enemy)
	enemy.global_position = pos
	
	
	
	
func spawn_enemy_nine():
	if not is_instance_valid(player):
		print("asd")
		return

	var angle = randf() * TAU
	var distance = sqrt(randf()) * spawn_radius + 1000       
	var offset = Vector2(cos(angle), sin(angle)) * distance
	var pos = player.global_position + offset

	var enemy = enemy_scene_six.instantiate()

	enemy_container.add_child(enemy)
	enemy.global_position = pos
	
	
func spawn_enemy_ten():
	if not is_instance_valid(player):
		print("asd")
		return

	var angle = randf() * TAU
	var distance = sqrt(randf()) * spawn_radius + 1000       
	var offset = Vector2(cos(angle), sin(angle)) * distance
	var pos = player.global_position + offset

	var enemy = enemy_scene_six.instantiate()

	enemy_container.add_child(enemy)
	enemy.global_position = pos
