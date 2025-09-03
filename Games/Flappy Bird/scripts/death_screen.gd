extends CanvasLayer

@onready var firstRun = true
func _ready() -> void:
	$Panel/VBoxContainer/Label.text = "Flappy Pixel"
	$Panel/VBoxContainer/Label2.text = ""
	$Panel/VBoxContainer/Button.text = "start Game"
	firstRun = false

func _on_button_pressed() -> void:
	pass # Replace with function body.


func _on_button_2_pressed() -> void:
	pass # Replace with function body.
