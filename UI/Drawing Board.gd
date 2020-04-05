extends ColorRect

# Credit to https://godotengine.org/qa/24621/painting-game-persist-drawing

signal drawing_finished

const brush_size = 7
const circle_connecting_gap = 2

var _pen = null
var _prev_mouse_pos = Vector2()
var _viewport = null
var _board = null

var was_drawing_last_time = false

var can_draw = false

func reset():
	_viewport = Viewport.new()
	var rect = get_rect()
	_viewport.size = rect.size
	_viewport.usage = Viewport.USAGE_2D
	_viewport.render_target_clear_mode = Viewport.CLEAR_MODE_ONLY_NEXT_FRAME
	_viewport.render_target_v_flip = true
	
	_pen = Node2D.new()
	_viewport.add_child(_pen)
	_pen.connect("draw", self, "_on_draw")
	
	add_child(_viewport)
	
	# Use a sprite to display the result texture
	var rt = _viewport.get_texture()
	_board = TextureRect.new()
	_board.set_texture(rt)
	_board.material = global.shader_material
	add_child(_board)

func _ready():
	reset()

func _process(_delta):
	_pen.update()

func _on_draw():
	if not can_draw or global.started:
		return
	
	var mouse_pos = get_local_mouse_position()
	
	var pause_draw_pressed = Input.is_action_pressed("pause_draw")
	if Input.is_action_pressed("draw") or pause_draw_pressed:
		if not pause_draw_pressed:
			if _prev_mouse_pos == mouse_pos:
				_pen.draw_circle(mouse_pos, brush_size, global.brush_colour)
			else:
				for i in range(0, _prev_mouse_pos.distance_to(mouse_pos), circle_connecting_gap):
					var offset = _prev_mouse_pos.direction_to(mouse_pos) * i
					_pen.draw_circle(_prev_mouse_pos + offset, brush_size, global.brush_colour)
		
		was_drawing_last_time = true
	else:
		if was_drawing_last_time and not global.no_game:
			var drawing = _board.get_texture()
			emit_signal("drawing_finished", drawing)
			
			clear_drawing()
		
		was_drawing_last_time = false
	
	_prev_mouse_pos = mouse_pos

func clear_drawing():
	for child in get_children():
		remove_child(child)
	
	reset()

func _on_Drawing_Board_mouse_entered():
	can_draw = true

func _on_Drawing_Board_mouse_exited():
	can_draw = false
