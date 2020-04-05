extends Sprite

var brush_textures = {
	Color(0, 0, 0, 1) : preload("res://Brush/Art/Black Brush.png"),
	Color(0.498039, 0.498039, 0.498039, 1) : preload("res://Brush/Art/Grey Brush.png"),
	Color(0.533333, 0, 0.082353, 1) : preload("res://Brush/Art/Dark Red Brush.png"),
	Color(0.929412, 0.109804, 0.141176, 1) : preload("res://Brush/Art/Red Brush.png"),
	Color(1, 0.498039, 0.152941, 1) : preload("res://Brush/Art/Orange Brush.png"),
	Color(1, 0.94902, 0, 1) : preload("res://Brush/Art/Yellow Brush.png"),
	Color(0.133333, 0.694118, 0.298039, 1) : preload("res://Brush/Art/Green Brush.png"),
	Color(0, 0.635294, 0.909804, 1) : preload("res://Brush/Art/Blue Brush.png"),
	Color(0.247059, 0.282353, 0.8, 1) : preload("res://Brush/Art/Dark Blue Brush.png"),
	Color(0.639216, 0.286275, 0.643137, 1) : preload("res://Brush/Art/Purple Brush.png"),
	Color(1, 1, 1, 1) : preload("res://Brush/Art/White Brush.png"),
	Color(0.764706, 0.764706, 0.764706, 1) : preload("res://Brush/Art/Light Grey Brush.png"),
	Color(0.72549, 0.478431, 0.341176, 1) : preload("res://Brush/Art/Brown Brush.png"),
	Color(1, 0.682353, 0.788235, 1) : preload("res://Brush/Art/Pink Brush.png"),
	Color(1, 0.788235, 0.054902, 1) : preload("res://Brush/Art/Gold Brush.png"),
	Color(0.937255, 0.894118, 0.690196, 1) : preload("res://Brush/Art/Beige Brush.png"),
	Color(0.709804, 0.901961, 0.113725, 1) : preload("res://Brush/Art/Lime Brush.png"),
	Color(0.6, 0.85098, 0.917647, 1) : preload("res://Brush/Art/Light Blue Brush.png"),
	Color(0.439216, 0.572549, 0.745098, 1) : preload("res://Brush/Art/Blue-grey Brush.png"),
	Color(0.784314, 0.74902, 0.905882, 1) : preload("res://Brush/Art/Light Purple Brush.png")
}

func _physics_process(_delta):
	var target_position = get_global_mouse_position()
	
	var target_rotation = max(min((target_position - position).x / 50, PI/1.5), -PI/1.5)
	rotation = lerp_angle(rotation, target_rotation, 0.1)
	
	position = lerp(position, target_position, 0.5)

func change_colour(colour):
	global.brush_colour = colour
	
	var rounded_colour = Color(stepify(colour.r, 0.000001), stepify(colour.g, 0.000001), stepify(colour.b, 0.000001), 1)
	texture = brush_textures[rounded_colour]
