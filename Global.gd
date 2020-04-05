extends Node

var brush_colour = Color(0, 0, 0, 1)

var friends_node

var shader_material = preload("res://Resources/Transparent Shader Material.tres")

var started = false

var win = true

var no_game = false

func random_int(minimum, maximum): # The maximum number is not included.
	return randi() % maximum + minimum
