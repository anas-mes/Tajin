extends Control



@onready var main_btn =$Button
@onready var secondbutton = $Button2


func _ready():
	
	main_btn.process_mode = Node.PROCESS_MODE_ALWAYS
	secondbutton.process_mode = Node.PROCESS_MODE_ALWAYS

func _on_button_pressed():
	print("main")
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Menu.tscn")
	
	



func _on_button_2_pressed():
	get_tree().paused = false
	print("hewll0o2")
	get_tree().reload_current_scene()
