extends CanvasLayer

func _ready():
	if $"VSplitContainer/ColorRect2/MarginContainer/Drawing Board".connect("drawing_finished", get_parent().get_node("Friends"), "spawn_friend") != OK:
		print_debug("An error occured while connecting the drawing board's \"drawing_finished\" signal.")
	
	for colour_button in $VSplitContainer/ColorRect/MarginContainer/GridContainer.get_children():
		colour_button.connect("pressed", get_parent().get_node("Brush"), "change_colour", [colour_button.colour])
