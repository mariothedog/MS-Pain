extends Control

var win_screen = load("res://UI/Win Screen.png")
var lose_screen = load("res://UI/Lose Screen.png")

func _ready():
	if global.win:
		$TextureRect.texture = win_screen
	else:
		$TextureRect.texture = lose_screen

func _process(delta):
	if Input.is_action_just_pressed("restart"):
		global.brush_colour = Color(0, 0, 0, 1)
		global.started = false
		global.win = true
		global.no_game = false
		get_tree().change_scene("res://Level/Level.tscn")
