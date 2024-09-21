extends Node2D

@onready var animated_sprite = $BGanim

func _ready():
	# Ensure the animation is set to loop
	
	# Play the animation
	animated_sprite.play("roll")


func _on_button_pressed():
	get_tree().change_scene_to_file("res://GameScene.tscn")
