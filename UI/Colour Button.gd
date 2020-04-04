tool
extends TextureButton

export (Color, RGB) var colour setget set_colour

func set_colour(_colour):
	colour = _colour
	
	$"Main Colour".color = colour
