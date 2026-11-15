extends CharacterBody2D

var speed = 400
var ball_x = 0
var ball_y = 0
var target_pos = 0

func _ready():
	add_to_group("paddles")
	Ball.move.connect(_on_move)
	
func _physics_process(delta):
	var direction = 0

	if Ball.direction_x > 0:
		target_pos = Ball.position.y
	else:
		target_pos = get_viewport_rect().size.y / 2
	
	var diff = target_pos - Ball.position.y
	if abs(diff) > 4.0:
		velocity.y = sign(diff) * speed
	
	move_and_collide(Vector2(0, velocity.y * delta))
	
	var screen_size = get_viewport_rect().size
	var paddle_height = 32
	position.y = clamp(position.y, paddle_height/2, screen_size.y - (paddle_height/2))

func _on_move():
	target_pos = Ball.direction_y
