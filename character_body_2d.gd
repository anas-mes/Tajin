extends CharacterBody2D

var speed = 200
var rotation_speed = 360.0  # Degrees per second for the sawblade rotation

func _ready():
	# Initialize velocity in a random direction
	velocity = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized() * speed

func _physics_process(delta):
	# Move and check for collisions
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		# Bounce the velocity upon collision with the wall
		velocity = velocity.bounce(collision.get_normal())
	
	# Rotate the entire projectile around its own axis (sawblade effect)
	rotation += deg_to_rad(rotation_speed * delta)  # Convert degrees to radians for the rotation
