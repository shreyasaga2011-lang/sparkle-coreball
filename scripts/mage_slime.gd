extends Area2D

var health = 4
var can_take_damage = true # Toggle for damage ticks
@export var fire_rate := 1.0  # Time in seconds between shots
@onready var magic_bolt: Area2D = $MagicBolt
@export var projectile_scene: PackedScene
@onready var kill_tracker = get_tree().get_first_node_in_group("kill_tracker")
@onready var player = get_tree().get_first_node_in_group("player")
@export var forcefield_damage_interval := 0.3
@export var speed := 210.0
var in_forcefield = false
var forcefield_timer = 0.0
var fire_timer := 0.0
func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("forcefield"):
		in_forcefield = false

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullets") or area.is_in_group("explosion"):
		healthTick()
	if area.is_in_group("forcefield"):
		in_forcefield = true


func healthTick():
	# If we are in the "cooldown" period, ignore the damage
	if not can_take_damage:
		return

	health -= 1
	
	if health <= 0:
		die()
	else:
		# Start damage tick cooldown
		apply_damage_tick_cooldown()

func apply_damage_tick_cooldown():
	can_take_damage = false
	# Flash red to show they got hit
	modulate = Color.RED
	
	await get_tree().create_timer(0.2).timeout
	
	can_take_damage = true
	modulate = Color.WHITE # Return to normal

func die():
	set_physics_process(false)
	collision_layer = 0
	collision_mask = 0
	if kill_tracker:
		KillTrackerNode.add_kill()
		KillTrackerNode.add_money()
	queue_free()
@export var target_dist: float = 500.0

func _physics_process(delta: float) -> void:
	if player:
			var diff = player.global_position - global_position
			var distance = diff.length()
			var direction = diff.normalized()
			
			# Only move if the enemy is further away than the target distance
			if distance > target_dist:
				global_position += direction * speed * delta
			# Optional: Back up if the player gets too close
			elif distance < target_dist - 10.0: 
				global_position -= direction * speed * delta
			if distance < 600:
				fire_timer -= delta
				if fire_timer <= 0:
					shootMagic()
					fire_timer = fire_rate
	if in_forcefield:
		forcefield_timer += delta
		if forcefield_timer >= forcefield_damage_interval:
			healthTick()
			forcefield_timer = 0.0
	else:
		forcefield_timer = 0.0
	
func shootMagic():
	if projectile_scene:
		var bullet = projectile_scene.instantiate()
		bullet.global_position = global_position
		get_parent().add_child(bullet)
