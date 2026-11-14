extends CharacterBody2D

@export var speed = 400
@export var up_action = "ui_up"
@export var down_action = "ui_down"

func _ready():
	add_to_group("paddles")
	
func _physics_process(delta):
	var direction = 0
	
	if Input.is_action_pressed(up_action):
		direction = -1
	elif Input.is_action_pressed(down_action):
		direction = 1
	
	velocity.y = direction * speed
	move_and_collide(Vector2(0, velocity.y * delta))
	
	var screen_size = get_viewport_rect().size
	var paddle_height = 32
	position.y = clamp(position.y, paddle_height/2, screen_size.y - (paddle_height/2))
