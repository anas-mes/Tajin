extends CharacterBody2D

@export var speed: float = 200.0
@export var jump_speed: float = -400.0
@export var gravity: float = 800.0
@export var max_jumps: int = 2  # Allow for double jump

@onready var anim_player = $AnimationPlayer  # Reference to the AnimationPlayer node

# Internal velocity to handle movement
var velocityy = Vector2.ZERO

# Track the number of jumps
var jump_count = 0

func _physics_process(delta):
	# Initialize velocity based on input
	velocity.x = 0  # Reset horizontal velocity
	if Input.is_action_pressed("R"):
		velocity.x += speed
		anim_player.play("Walk")  # Play walk animation
	elif Input.is_action_pressed("L"):
		velocity.x -= speed
		anim_player.play("Walk")  # Play walk animation
	else:
		anim_player.play("Idle")  # Play idle animation when not moving

	# Check if the character is on the floor to reset the jump count
	if is_on_floor():
		jump_count = 0

	# Handle jumping
	if Input.is_action_just_pressed("U") and jump_count < max_jumps:
		velocity.y = jump_speed
		jump_count += 1
		anim_player.play("Jump")  # Play jump animation

	# Apply gravity
	velocity.y += gravity * delta

	# Move the character and handle collisions
	move_and_slide()

	# Constrain within boundaries (optional, can be added if needed)
	# position.x = clamp(position.x, left_boundary, right_boundary)
	# position.y = clamp(position.y, top_boundary, bottom_boundary)
