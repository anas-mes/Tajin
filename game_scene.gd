extends Node2D


var GameOverScene = preload("res://Gamemenu.tscn")
@onready var timer = $Control/Timer



func _process(delta):
	
		var time_left = timer.time_left
		if time_left <= 0:
	
			var game_over_instance = GameOverScene.instantiate()
	
			game_over_instance.z_index = 10
			add_child(game_over_instance)
	
	# Optionally, you can move the game over scene to the front
			
