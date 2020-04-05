extends Node2D

func _input(_event):
	if Input.is_action_just_pressed("restart"):
		global.brush_colour = Color(0, 0, 0, 1)
		global.started = false
		global.win = true
		global.no_game = false
		get_tree().reload_current_scene()

func _process(delta):
	if $Friends.get_child_count() > 0:
		$"MS Pain/VSplitContainer/ColorRect2/MarginContainer/Tutorial".visible = false
