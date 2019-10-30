extends Node

export (PackedScene) var Enemy
var meteor_count = 0
var score = 0

func _ready():
	randomize()

func _process(delta):
	if $StartTimer.time_left > 2:
		$TimeToStart.text = "3"
	elif $StartTimer.time_left > 1:
		$TimeToStart.text = "2"
	elif $StartTimer.time_left > 0:
		$TimeToStart.text = "1"

func _on_StartTimer_timeout():
	$MeteorTimer.start()
	$ScoreTimer.start()
	$TimeToStart.text = " "
	$Player.start()


func _on_MeteorTimer_timeout():
	var i = 0
	while i <= meteor_count / 10:
		i += 1
		meteor_count += 1
		var enemy = Enemy.instance()
		add_child(enemy)
	
	if $MeteorTimer.wait_time > 1:
		$MeteorTimer.wait_time -= .2


func _on_ScoreTimer_timeout():
	score += 1
	$UI.update_score(score)


func _on_UI_start_game():
	$StartTimer.start()


func _on_Player_hit():
	$UI/ScoreLabel.text = " "
	$ScoreTimer.stop()
	$MeteorTimer.stop()
	$UI.game_over()
