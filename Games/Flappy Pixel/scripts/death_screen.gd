extends CanvasLayer

signal start_game

@onready var label_title: Label = $Panel/VBoxContainer/Label
@onready var label_score: Label = $Panel/VBoxContainer/Label2
@onready var button: Button = $Panel/VBoxContainer/Button

func _ready() -> void:
	label_title.text = "Flappy Pixel"
	label_score.text = ""
	button.text = "Start Game"
	button.pressed.connect(_on_button_pressed)

func _on_button_pressed() -> void:
	emit_signal("start_game")
	label_title.text = "Game Over"
	button.text = "Try Again"
