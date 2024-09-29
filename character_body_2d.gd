extends CharacterBody2D




var speed = 200
var rotation_speed = 220.0  # Degrees per second for the sawblade rotation

func _ready():
	# Initialize velocity in a random direction
	velocity = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized() * speed
	#playerhit.connect(game_over)
	# Set up collision layer and mask
	collision_layer = 0b10  # Layer 2 (projectiles)
	collision_mask = 0b1    # Layer 1 (environment)

func _physics_process(delta):
	# Move and check for collisions
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		# Bounce the velocity upon collision with the wall
		velocity = velocity.bounce(collision.get_normal())
	
	# Rotate the entire projectile around its own axis (sawblade effect)
	rotation += deg_to_rad(rotation_speed * delta)  # Convert degrees to radians for the rotation


	


func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		body.player()
		body.get_parent().game_over()
