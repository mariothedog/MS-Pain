extends CanvasLayer

func _ready():
	if $"VSplitContainer/ColorRect2/MarginContainer/Drawing Board".connect("drawing_finished", get_parent().get_node("Friends"), "spawn_friend") != OK:
		print_debug("An error occured while connecting the drawing board's \"drawing_finished\" signal.")
	
	for colour_button in $VSplitContainer/ColorRect/MarginContainer/HSplitContainer/GridContainer.get_children():
		colour_button.connect("pressed", get_parent().get_node("Brush"), "change_colour", [colour_button.colour])

func _on_Start_pressed():
	if not global.started:
		global.started = true
		get_parent().get_node("Enemies").start_spawning()

func _on_Button_pressed():
	global.no_game = true
	$"VSplitContainer/ColorRect/MarginContainer/HSplitContainer/Start".visible = false
	$VSplitContainer/ColorRect2/MarginContainer/Tutorial.visible = false
