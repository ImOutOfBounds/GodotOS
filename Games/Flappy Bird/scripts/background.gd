extends ParallaxBackground


var background_fundo: Vector2 = Vector2()

func _ready():
	pass # Replace with function body.



func _process(delta):
	background_fundo.x -= 1
	set_scroll_offset(background_fundo)
