extends RigidBody2D

@export var bounce_factor = 0.8
@export var lifetime = 5.0
@export var rotation_speed = 5.0

@onready var speed = 200





func _integrate_forces(state):
	# Handle bouncing
	for i in range(state.get_contact_count()):
		var collision_normal = state.get_contact_local_normal(i)
		var velocity = state.get_linear_velocity()
		
		# Calculate the bounce velocity
		var bounce_velocity = velocity.bounce(collision_normal) * bounce_factor
		
		# Apply the new velocity
		state.set_linear_velocity(bounce_velocity)

func _on_Projectile_body_entered(body):
	# You can add additional logic here for when the projectile hits something
	pass
