extends CanvasLayer

signal start_game

func _ready() -> void:
	$Panel/VBoxContainer/Label.text = "Flappy Pixel"
	$Panel/VBoxContainer/Label2.text = ""
	$Panel/VBoxContainer/Button.text = "Start Game"

func _on_button_pressed() -> void:
	# Caminho completo para o player
	var bird = get_parent().get_node("Bird")  

	# Verifica highscore
	var new_best = bird.check_highscore()

	emit_signal("start_game")

	# Atualiza a tela de morte
	$Panel/VBoxContainer/Label.text = "Game Over"
	if new_best:
		$Panel/VBoxContainer/Label2.text = "New Best!\nHighscore: %d" % bird.highscore
	else:
		$Panel/VBoxContainer/Label2.text = "Highscore: %d" % bird.highscore

	$Panel/VBoxContainer/Button.text = "Try Again"
