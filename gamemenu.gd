extends Control



@onready var main_btn =$Button


func _ready():
	
	main_btn.process_mode = Node.PROCESS_MODE_ALWAYS

func _on_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Menu.tscn")
