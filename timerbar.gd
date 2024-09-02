extends Control

@onready var progress_bar = $ProgressBar
@onready var timer = $Timer
@onready var game_over_label = %GOLabel
@onready var tajine_node = get_node("../Tajine")  # Adjust this path to match your scene hierarchy

func _ready():
	timer.start()
	progress_bar.max_value = timer.wait_time
	progress_bar.value = timer.wait_time
	game_over_label.visible = false

func _process(delta):
	var time_left = timer.time_left
	progress_bar.value = time_left
	if time_left <= 0:
		game_over()

func game_over():
	
	var tajine_sprite = tajine_node.get_node("%Tajinesprite")
		
	tajine_sprite.modulate = Color(0.2, 0.2, 0.2)  # Darken the sprite

	get_tree().paused = true
	game_over_label.visible = true
	
