extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -320.0
var life = 0
var points: int = 0

@export var shadow: PackedScene
@onready var hud = $Hud
@onready var initialPosition

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void:
	initialPosition = position
	
func add_point():
	points += 1
	hud.set_label_text(points)

func _physics_process(delta): 
	if life > 0:
		$DeathScreen.hide()
		
		if is_on_ceiling() or is_on_wall() or is_on_floor():
			life = 0
			
		if not is_on_floor():
			velocity.y += gravity * delta

		if Input.is_action_just_pressed("jump"):
			velocity.y = JUMP_VELOCITY

			var shadowInst = shadow.instantiate()
			shadowInst.position = global_position  
			get_parent().add_child(shadowInst)  

		if velocity.y < 90:
			if self.rotation > -.3:
				self.rotation -= 10 * delta

		else:
			velocity.y = 300

		if velocity.y > 90:
			if self.rotation < 1:
				self.rotation += 4 * delta

		move_and_slide()
	else:
		$DeathScreen.show()


func _on_death_screen_start_game() -> void:
	position = initialPosition
	life = 1
