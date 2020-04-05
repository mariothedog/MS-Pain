extends ColorRect

# Credit to https://godotengine.org/qa/24621/painting-game-persist-drawing

const brush_size = 7
const circle_connecting_gap = 2

var _pen = null
var _prev_mouse_pos = Vector2()

func _ready():
	var viewport = Viewport.new()
	var rect = get_rect()
	viewport.size = rect.size
	viewport.usage = Viewport.USAGE_2D
	viewport.render_target_clear_mode = Viewport.CLEAR_MODE_ONLY_NEXT_FRAME
	viewport.render_target_v_flip = true

	_pen = Node2D.new()
	viewport.add_child(_pen)
	_pen.connect("draw", self, "_on_draw")

	add_child(viewport)

	# Use a sprite to display the result texture
	var rt = viewport.get_texture()
	var board = TextureRect.new()
	board.set_texture(rt)
	add_child(board)

func _process(_delta):
	_pen.update()

func _on_draw():
	var mouse_pos = get_local_mouse_position()
	
	if Input.is_action_pressed("draw"):
		if _prev_mouse_pos == mouse_pos:
			_pen.draw_circle(mouse_pos, brush_size, global.brush_colour)
		else:
			for i in range(0, _prev_mouse_pos.distance_to(mouse_pos), circle_connecting_gap):
				var offset = _prev_mouse_pos.direction_to(mouse_pos) * i
				_pen.draw_circle(_prev_mouse_pos + offset, brush_size, global.brush_colour)
	
	_prev_mouse_pos = mouse_pos
