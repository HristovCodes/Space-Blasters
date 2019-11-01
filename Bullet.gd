extends Area2D

var speed = 500
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().play_shoot()
	look_at(get_global_mouse_position())
	velocity = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
	position += velocity * delta

func _on_Visibility_screen_exited():
	queue_free()

func _on_Bullet_body_entered(body):
	get_parent().play_explosion()
	get_parent().score += 10
	get_parent()._on_ScoreTimer_timeout()
	body.queue_free()
	queue_free()
