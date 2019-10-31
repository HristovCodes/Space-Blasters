extends RigidBody2D

export (PackedScene) var Coin

export var speed = 400
var velocity = Vector2()
var health = 1
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	if rng.randi_range(1, 4) == 1:
		rng.randomize()
		position = Vector2(rng.randf_range(0, get_viewport_rect().size.x ), 0)
	elif rng.randi_range(1, 4) == 2:
		rng.randomize()
		position = Vector2(get_viewport_rect().size.x, rng.randf_range(0, get_viewport_rect().size.y))
	elif rng.randi_range(1, 4) == 3:
		rng.randomize()
		position = Vector2(rng.randf_range(0, get_viewport_rect().size.x ), get_viewport_rect().size.y)
	else:
		rng.randomize()
		position = Vector2(0, rng.randf_range(0, get_viewport_rect().size.y))

	look_at(get_global_mouse_position())
	velocity = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
	linear_velocity = velocity

func _on_Visibility_screen_exited():
	queue_free()
