extends Node2D

func _ready():
	randomize()
	var y_range = Vector2(100, 400)
	var random_y =  randi() % int(y_range[1]-y_range[0]) + 1 + y_range[0]
	self.position.y = random_y


func _process(delta):
	self.position.x -= 2

	if position.x < -100:
			queue_free()
