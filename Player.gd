extends Area2D

signal hit

export var speed = 250
var velocity = Vector2()
var health = 1
var shield = 0
var start_pos

func _ready():
	hide()
	position = Vector2(get_viewport_rect().size.x / 2, get_viewport_rect().size.y / 2)
	start_pos = position


func _physics_process(delta):
	look_at(get_global_mouse_position())
	velocity = Vector2(speed, 0).rotated(rotation)
	position += velocity * delta

func _on_Player_body_entered(body):
	hide()  # Player disappears after being hit.
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)

func start():
	position = start_pos
	show()
	$CollisionShape2D.disabled = false
