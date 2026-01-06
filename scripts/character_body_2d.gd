extends CharacterBody2D
var big_bullet = preload("res://scenes/big_bullet.tscn")
var bullet_scene = preload("res://scenes/bullet.tscn")
@onready var shooty_part: Node2D = $ShootyPart
@onready var shooty_part_two: Node2D = $ShootyPartTwo
@onready var detector: Area2D = $detector
@onready var explosive_shooty: Node2D = $ExplosiveShooty

var cooldown = true
var big_bullet_upgrade = true
const SPEED = 400.0
const ACCEL = 1500
const FRIC = 1400
var firerate = 0.5

var input = Vector2.ZERO

func _physics_process(delta: float) -> void:
	player_movement(delta)
	look_at(get_global_mouse_position())

	if Input.is_action_just_pressed("shoot"):
		if big_bullet_upgrade == false:
			var bullet = bullet_scene.instantiate()
			bullet.global_position = shooty_part.global_position
			bullet.direction = (get_global_mouse_position() - global_position).normalized()
			get_parent().add_child(bullet)
			var bulletTwo = bullet_scene.instantiate()
			bulletTwo.global_position = shooty_part_two.global_position
			bulletTwo.direction = (get_global_mouse_position() - global_position).normalized()
			get_parent().add_child(bulletTwo)
		
	if Input.is_action_just_pressed("shoot"):
		if cooldown == true:
			if big_bullet_upgrade == true:
				var bigBullet = big_bullet.instantiate()
				bigBullet.global_position = explosive_shooty.global_position
				bigBullet.direction = (get_global_mouse_position() - global_position).normalized()
				get_parent().add_child(bigBullet)
				cooldown = false
				await get_tree().create_timer(firerate * upgrades.multi).timeout
				cooldown = true

func get_input():
	input.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	input.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
	return input.normalized()

	
func player_movement(delta):
	input = get_input()
	
	if input == Vector2.ZERO:
		if velocity.length() > (FRIC * delta):
			velocity -= velocity.normalized() * (FRIC * delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (input * ACCEL * delta)
		velocity = velocity.limit_length(SPEED)
	move_and_slide()

var health = 2

func healthTick():
	health -= 1
	if(health == 0):
		queue_free()
		get_tree().change_scene_to_file("res://scenes/deathscreen.tscn")
