extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -320.0
@export var life = 0
var points: int = 0
var highscore: int = 0

@export var shadow: PackedScene
@onready var hud = $Hud
@onready var sfx = $sfx
@onready var initialPosition

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var alive = true

func _ready() -> void:
	initialPosition = position

func add_point():
	points += 1
	hud.set_label_text(points)
	if sfx:
		sfx.play_coin()  # toca som de moeda

func check_highscore() -> bool:
	# Retorna true se for um novo highscore
	if points > highscore:
		highscore = points
		return true
	return false

func _physics_process(delta): 
	if life > 0 and alive:
		# Checa colisão com chão, parede ou teto
		if is_on_ceiling() or is_on_wall() or is_on_floor():
			life = 0
			alive = false
			if sfx:
				sfx.play_death()  # toca som de morte

		if not is_on_floor():
			velocity.y += gravity * delta

		# Pulo
		if Input.is_action_just_pressed("jump"):
			velocity.y = JUMP_VELOCITY
			var shadowInst = shadow.instantiate()
			shadowInst.position = global_position  
			get_parent().add_child(shadowInst)  

		# Rotação do sprite
		if velocity.y < 90:
			if self.rotation > -.3:
				self.rotation -= 10 * delta
		else:
			velocity.y = 300

		if velocity.y > 90:
			if self.rotation < 1:
				self.rotation += 4 * delta

		move_and_slide()

func reset_player():
	hud.set_label_text(0)
	position = initialPosition
	velocity = Vector2.ZERO
	rotation = 0
	points = 0
	alive = true
	life = 1
