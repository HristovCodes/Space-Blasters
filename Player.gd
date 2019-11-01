extends Area2D

signal hit

export (PackedScene) var Bullet
export var speed = 250
var velocity = Vector2()
var health = 0
var start_pos
var bullets = 5

func _ready():
	hide()
	position = Vector2(get_viewport_rect().size.x / 2, get_viewport_rect().size.y / 2)
	start_pos = position

func _input(event):
	if (event.is_pressed() and event.button_index == BUTTON_LEFT):
		shoot()

func _physics_process(delta):
	look_at(get_global_mouse_position())
	velocity = Vector2(speed, 0).rotated(rotation)
	position += velocity * delta

func _on_Player_body_entered(body):
	health -= 1
	if health < 1:
		body.queue_free()
		hide()  # Player disappears after being hit.
		emit_signal("hit")
		$CollisionShape2D.set_deferred("disabled", true)

func shoot():
	if health > 0 and bullets > 0:
		$Reload.start()
		bullets -= 1
		get_parent().get_node("UI").update_bullets(bullets)
		var bullet = Bullet.instance()
		bullet.position = Vector2(position.x, position.y)
		get_parent().add_child(bullet)

func start():
	health = 1
	position = start_pos
	show()
	$CollisionShape2D.disabled = false


func _on_Reload_timeout():
	bullets = 5
	get_parent().get_node("UI").update_bullets(bullets)
