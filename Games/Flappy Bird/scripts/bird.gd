extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -320.0

var vida = 1

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta): 

	if is_on_ceiling() or is_on_wall() or is_on_floor():
		vida = 0
		
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY

	if velocity.y < 90:
		if self.rotation > -.8:
			self.rotation -= 10 * delta

	else:
		velocity.y = 300

	if velocity.y > 90:
		if self.rotation < 1:
			self.rotation += 4 * delta

	
	move_and_slide()
