extends Marker2D
@onready var projectil = load("res://projectile_plus.tscn")
@export var min_angle: float = -60.0
@export var max_angle: float = 60.0
@export var projectile_speed: float = 130.0
@onready var timer = $"../Timer"

func _ready():
	timer.start()  # Starts the timer immediately when the launcher is ready
	timer.timeout.connect(_on_timer_timeout)
	print("Launcher ready")

func launch_projectile():
	var projectile = projectil.instantiate()
	get_parent().add_child(projectile)
	projectile.global_position = global_position
	
	# Generate a random angle between the min_angle and max_angle
	var random_angle = deg_to_rad(randf_range(min_angle, max_angle))
	var direction = Vector2.DOWN.rotated(random_angle)  # Rotate DOWN by the random angle
	
	# Set the velocity of the projectile
	projectile.velocity = direction.normalized() * projectile_speed

	# Ensure the projectile is set up with the correct collision layers
	projectile.collision_layer = 0b10  # Layer 2
	projectile.collision_mask = 0b1    # Layer 1

func trigger_launch():
	print("Launching projectile")
	launch_projectile()

func _on_timer_timeout():
	timer.start()  # Restart the timer
	trigger_launch()
