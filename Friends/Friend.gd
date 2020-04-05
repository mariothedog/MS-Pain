extends Area2D

const SPEED = 100

var velocity = Vector2()

func _physics_process(delta):
	if position.x > 0:
		velocity.x = SPEED
	else:
		velocity.x = -SPEED
	
	position += velocity * delta
