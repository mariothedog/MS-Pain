extends Node2D

var enemy_scene = preload("res://Enemies/Enemy.tscn")

var finished = false

func start_spawning():
	$"Enemy Spawn".start()
	$"Game Finished".start()

func _process(_delta):
	if finished:
		if get_child_count() - 2 == 0:
			global.win = true
			if get_tree().change_scene("res://UI/Game Finished Screen.tscn") != OK:
				print_debug("An error occured while changing scene.")
		else:
			if get_parent().get_node("Friends").get_child_count() == 0:
				global.win = false
				if get_tree().change_scene("res://UI/Game Finished Screen.tscn") != OK:
					print_debug("An error occured while changing scene.")

func _on_Enemy_Spawn_timeout():
	var enemy = enemy_scene.instance()
	var side = global.random_int(0, 2)
	var pos = Vector2()
	match side:
		0:
			# Left.
			pos.x = -562
			enemy.dir = 1
		1:
			# Right.
			pos.x = 562
			enemy.dir = -1
	pos.y = global.random_int(-145, 370)
	enemy.position = pos
	add_child(enemy)

func _on_Game_Finished_timeout():
	$"Enemy Spawn".stop()
	finished = true
