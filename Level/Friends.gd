extends Node2D

var friend_scene = preload("res://Friends/Friend.tscn")

func _ready():
	global.friends_node = self

func spawn_friend(texture):
	var friend = friend_scene.instance()
	var friend_sprite = friend.get_node("Sprite")
	friend_sprite.texture = texture
	friend_sprite.material = global.shader_material
	friend.position = get_global_mouse_position()
	friend_sprite.position -= get_global_mouse_position()
	friend.position += Vector2(0, 37)
	
	add_child(friend)
