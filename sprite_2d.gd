extends Sprite2D


@onready var anim_player =$BGroll


func _physics_process(delta):
	anim_player.play("roll")
	
	
	
