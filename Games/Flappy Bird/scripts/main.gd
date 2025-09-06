extends Node2D

@export var pipe: PackedScene
@export var coin: PackedScene

@onready var deathScreen = $DeathScreen
@onready var bg = $Background
@onready var bird = $Bird

var delay = 1
var spawnPipe = false
var game_running = true 

func criar_item():
	if not game_running:
		return

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

	if game_running and bird.life <= 0:
		game_running = false
		deathScreen.show()

		for obj in get_tree().get_nodes_in_group("movable"):
			obj.canMove = false

		bg.can_move = false


func _on_death_screen_start_game() -> void:
	deathScreen.hide()

	for obj in get_tree().get_nodes_in_group("movable"):
		obj.queue_free()

	bird.reset_player()

	game_running = true
	bg.can_move = true
