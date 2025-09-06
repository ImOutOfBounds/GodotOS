extends CanvasLayer

signal start_game

func _ready() -> void:
	$Panel/VBoxContainer/Label.text = "Flappy Pixel"
	$Panel/VBoxContainer/Label2.text = ""
	$Panel/VBoxContainer/Button.text = "start Game"

func _on_button_pressed() -> void:
	emit_signal("start_game")
	$Panel/VBoxContainer/Label.text = "Game Over"
	$Panel/VBoxContainer/Label2.text = "Score: x"
	$Panel/VBoxContainer/Button.text = "Try Again"
	self.hide()


func _on_button_2_pressed() -> void:
	pass # Replace with function body.
