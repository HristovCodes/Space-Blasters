extends Node

export (PackedScene) var Enemy
var meteor_count = 0
var score = 0
var highscore = 0

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
	$UI/Bullets.show()
	$UI/ScoreLabel.show()
	$MeteorTimer.start()
	$ScoreTimer.start()
	$TimeToStart.text = " "
	$Player.start()


func _on_MeteorTimer_timeout():
	var i = 0
	while i <= meteor_count / 10:
		i += 1
		var enemy = Enemy.instance()
		add_child(enemy)
	meteor_count += 1
	
	if $MeteorTimer.wait_time > 1:
		$MeteorTimer.wait_time -= .2


func _on_ScoreTimer_timeout():
	score += 1
	$UI.update_score(score)

func _on_UI_start_game():
	$StartTimer.start()

func _on_Player_hit():
	if score > highscore:
		highscore = score
		$UI.update_high_score(highscore)
	$ScoreTimer.stop()
	$MeteorTimer.stop()
	$UI.game_over()
	score = 0
	meteor_count = 0


#SFX
func play_shoot():
	$Shoot.play()

func play_explosion():
	$Explosion.play()