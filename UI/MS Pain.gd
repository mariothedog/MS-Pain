extends CanvasLayer

func _ready():
	for colour_button in $VSplitContainer/ColorRect/MarginContainer/GridContainer.get_children():
		colour_button.connect("pressed", get_parent().get_node("Brush"), "change_colour", [colour_button.colour])
