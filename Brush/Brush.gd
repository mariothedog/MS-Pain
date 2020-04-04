extends KinematicBody2D

func _physics_process(_delta):
	var target_position = get_global_mouse_position()
	
	position = lerp(position, target_position, 0.5)
	
	var target_rotation = get_global_mouse_position().rotated(-PI/2).angle()

	rotation = lerp_angle(rotation, target_rotation, 0.1)
