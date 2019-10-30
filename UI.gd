extends CanvasLayer
signal start_game

func _ready():
	$ScoreLabel.text = str(0)
	$ScoreLabel.hide()
	$PlayAgain.hide()
	$HighScore.hide()

func update_score(score):
    $ScoreLabel.text = str(score)

func update_high_score(score):
	$ScoreLabel.hide()
	$HighScore.show()
	$HighScore.text = "New high score!\nYou got " + str(score) + " points."

func _on_Quit_pressed():
	get_tree().quit()

func _on_Start_pressed():
	emit_signal("start_game")
	$Credits.hide()
	$Options.hide()
	$Quit.hide()
	$WelcomeLabel.hide()
	$Start.hide()

func game_over():
	$ScoreLabel.hide()
	$PlayAgain.show()

func _on_PlayAgain_pressed():
	$ScoreLabel.text = str(0)
	emit_signal("start_game")
	$PlayAgain.hide()
	$HighScore.hide()
