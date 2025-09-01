extends Sprite2D

func _ready():
	self_modulate = Color(1, 1, 1, 1)
	ghosting()

func ghosting():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "self_modulate", Color(1, 1, 1, 0), 0.75)
	await tween.finished
	queue_free()

func _process(delta: float) -> void:
	position.x -= 1
