extends Node2D


@export var pipe: PackedScene
@export var coin: PackedScene

@onready var deathScreen = $DeathScreen

var delay = 1
var spawnPipe = false

func criar_item():
	var Inst
	spawnPipe = !spawnPipe

	if spawnPipe:
		Inst = pipe.instantiate()
	else:
		Inst = coin.instantiate()

	Inst.position.x = 1200
	Inst.add_to_group("movable")
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
		
	if $Area2D/Bird.life <= 0:
		deathScreen.show()
		
		for obj in get_tree().get_nodes_in_group("movable"):
			obj.canMove = false
	else:
		deathScreen.hide()


func _on_death_screen_start_game() -> void:
	$Area2D/Bird.position = $Area2D/Bird.initialPosition
	$Area2D/Bird.life = 1
