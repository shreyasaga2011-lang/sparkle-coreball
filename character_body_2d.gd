extends CharacterBody2D

const SPEED = 400.0
const ACCEL = 1500
const FRIC = 1400

var input = Vector2.ZERO

func _physics_process(delta: float) -> void:
	player_movement(delta)
	look_at(get_global_mouse_position())

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
