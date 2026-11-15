extends ProgressBar

var fill = $".".get_theme_stylebox("fill") as StyleBoxFlat

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fill.bg_color = Color(0.914, 0.357, 0.377, 1.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	value -= 0.1
	
	if Input.is_action_just_pressed("ui_accept"):
		reduce_timer()

func reduce_timer():
	value-= 2.5
