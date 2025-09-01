extends Node2D


@export var pipe: PackedScene
@export var coin: PackedScene
var delay = 1
var spawnPipe = false

func criar_item():
	var Inst
	spawnPipe = !spawnPipe

	if spawnPipe:
		Inst = pipe.instantiate()
	else:
		Inst = coin.instantiate()
		print("coin time")

	Inst.position.x = 1200
	add_child(Inst)
	
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
