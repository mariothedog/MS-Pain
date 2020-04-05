extends Area2D

const SPEED = 100

var velocity = Vector2()

var dir = 0

const colours = [Color(1, 0, 0, 1), Color(0, 0, 1, 1), Color(1, 1, 0, 1), Color(0.8, 0.8, 0.8, 1)]

func _ready():
	$Main.color = colours[global.random_int(0, colours.size())]

func _physics_process(delta):
	velocity.x = dir * SPEED
	position += delta * velocity

func _on_Enemy_area_entered(area):
	if not "Enemy" in area.name:
		area.queue_free()
		queue_free()
