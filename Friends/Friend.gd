extends Area2D

const SPEED = 50

var velocity = Vector2()

func _physics_process(delta):
	if global.started:
		if position.x > 0:
			velocity.x = SPEED
		else:
			velocity.x = -SPEED
		
		position += velocity * delta
