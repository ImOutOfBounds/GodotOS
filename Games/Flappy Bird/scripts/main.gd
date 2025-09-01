extends Node2D


@export var pipe: PackedScene
var delay = 2
var screen_size = get_viewport_rect().size

func criar_item():
	var pipeInst = pipe.instantiate()
	pipeInst.position = Vector2(1200, randf_range(100, screen_size.y - 100))
	add_child(pipeInst)
	
	$Timer.wait_time = delay
	$Timer.start()


func _ready():
	criar_item()

func _on_timer_timeout():
	criar_item()
	$Timer.start(delay)
	
func _process(delta):
	if Input.is_action_just_pressed("ui_text_clear_carets_and_selection"):
		get_tree().quit()
