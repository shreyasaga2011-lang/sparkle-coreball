extends Area2D

@onready var collision: CollisionShape2D = $CollisionShape2D

@export var speed := 600.0
var direction := Vector2.ZERO
var size_multiplier: float = 1.0
var hit_growth := 3.0 

func _ready() -> void:
	# CRITICAL: This ensures that growing THIS bullet's radius 
	# doesn't grow the radius of every other bullet on screen.
	collision.shape = collision.shape.duplicate()
	
	if size_multiplier != 1.0:
		scale = Vector2(size_multiplier, size_multiplier)

func _physics_process(delta):
	global_position += direction * speed * delta

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		# Check if the enemy has a health script to avoid errors
		if area.has_method("healthTick"):
			area.healthTick()
		explode()

func explode():
	speed = 0
	
	# Disconnect to ensure it only explodes once
	if is_connected("area_entered", _on_area_entered):
		disconnect("area_entered", _on_area_entered)
	
	if collision.shape is CircleShape2D:
		var target_radius = collision.shape.radius * hit_growth
		var tween = create_tween()
		
		# Animate Visuals
		tween.parallel().tween_property(self, "scale", scale * hit_growth, 0.1)
		# Animate Physics Shape Radius
		tween.parallel().tween_property(collision.shape, "radius", target_radius, 0.1)
		# Fade out
		tween.parallel().tween_property(self, "modulate:a", 0.0, 0.1)
		
		tween.tween_callback(damage_nearby_enemies)
		tween.tween_callback(queue_free)
	else:
		# Fallback if the shape isn't a circle
		queue_free()

func damage_nearby_enemies():
	var bodies = get_overlapping_areas()
	for body in bodies:
		# Don't damage the one we already hit in _on_area_entered
		if body.is_in_group("enemy") and body.has_method("healthTick"):
			body.healthTick()
