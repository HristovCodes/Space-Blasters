extends CanvasLayer
signal start_game

func _ready():
	$ScoreLabel.text = " "
	$PlayAgain.hide()

func update_score(score):
    $ScoreLabel.text = str(score)

func _on_Quit_pressed():
	get_tree().quit()

func _on_Start_pressed():
	#will start the game for now just hides the other buttons
	emit_signal("start_game")
	$Credits.hide()
	$Options.hide()
	$Quit.hide()
	$WelcomeLabel.hide()
	$Start.hide()

func game_over():
	$PlayAgain.show()

func _on_PlayAgain_pressed():
	emit_signal("start_game")
	$PlayAgain.hide()
