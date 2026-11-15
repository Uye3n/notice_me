class_name ball extends CharacterBody2D

signal out_of_bounds
signal move

@export var speed = 250
var direction_x = 0
var direction_y = 0
var collision = Vector2(0, 0)

# Reset ball's position and velocity
func start():
	# Start at the middle of the screen 
	position = get_viewport_rect().size / 2
	
	# Give it a random direction
	direction_x = 1.0 if randf() > 0.5 else -1.0
	direction_y = randf_range(-0.5, 0.5)
	
	# Apply direction and speed
	velocity = Vector2(direction_x, direction_y).normalized() * speed


func _ready():
	start()

func _physics_process(delta):
	if position.x < 0 or position.x > get_viewport_rect().size.x:
		out_of_bounds.emit()
		start()
		
	move.emit()
	
	collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		
		# Add velocity each time ball hits a paddle
		var thing_we_hit = collision.get_collider()
		if thing_we_hit.is_in_group("paddles"):
			velocity *= 1.2

func stop():
	position = get_viewport_rect().size / 2
	speed = 0

func get_direction_x() -> int:
	if direction_x < 0:
		return -1
	
	return 1

func get_direction_y() -> int:
	if direction_y < 0:
		return -1
	
	return 1
