extends ParallaxBackground

var background_fundo: Vector2 = Vector2()
var can_move: bool = true 

func _process(delta):
	if can_move:
		background_fundo.x -= 1
		set_scroll_offset(background_fundo)
