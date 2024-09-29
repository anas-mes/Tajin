extends Control

@onready var progress_bar = $ProgressBar
@onready var timer = $Timer
@onready var game_over_label = %GOLabel
@onready var tajine_node = get_node("../Tajine") 
@onready var pause_btn = $"../Pausebutton"
@onready var pause_label = $"../PauseLabel"
var is_paused = false

# Preload the game over scene
var GameOverScene = preload("res://Gamemenu.tscn")

func _ready():
	timer.start()
	progress_bar.max_value = timer.wait_time
	progress_bar.value = timer.wait_time
	
	pause_label.visible = false
	pause_btn.connect("pressed", Callable(self, "_on_pause_button_pressed"))
	pause_btn.process_mode = Node.PROCESS_MODE_ALWAYS

func _process(delta):
	if not is_paused:
		var time_left = timer.time_left
		progress_bar.value = time_left
		
			


	

func toggle_pause():
	is_paused = !is_paused
	get_tree().paused = is_paused
	pause_label.visible = is_paused
	if is_paused:
		timer.paused = true
		pause_btn.text = "Resume"
	else:
		timer.paused = false
		pause_btn.text = "Pause"
	
	print("Pause toggled. Is paused: ", is_paused)

func _on_pause_button_pressed():
	print("Pause button pressed")
	toggle_pause()
