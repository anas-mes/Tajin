extends Control


func _on_startbtn_pressed():
	get_tree().change_scene_to_file("res://GameScene.tscn")

func _on_settingsbtn_pressed():
	get_tree().change_scene_to_file("res://path_to_your_settings_scene.tscn")


func _on_creditsbtn_pressed():
	get_tree().change_scene_to_file("res://path_to_your_credits_scene.tscn")
