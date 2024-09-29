extends Node2D


var GameOverScene = preload("res://Gamemenu.tscn")
@onready var timer = $Control/Timer
@onready var game_over_label = %GOLabel
@onready var tajine_node = $Tajine

func _onready():
	
	game_over_label.visible = false
	
	





func _process(delta):
	
		var time_left = timer.time_left
		if time_left <= 0:
			game_over()
			
	
			
	
	# Optionally, you can move the game over scene to the front
			
func game_over():
	var tajine_sprite = tajine_node.get_node("%Tajinesprite")
	tajine_sprite.modulate = Color(0.2, 0.2, 0.2)
	
	var game_over_instance = GameOverScene.instantiate()
	add_child(game_over_instance)
	game_over_instance.z_index = 10
	game_over_label.visible = true
	get_tree().paused = true
	


func _on_area_2d_body_entered(body):
	print("ciar")
	body.queue_free()
	
	


func _on_area_2d_area_entered(area):
	print("ciar")
	area.get_parent().queue_free()
