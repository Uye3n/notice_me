extends ProgressBar

var fill = $".".get_theme_stylebox("fill") as StyleBoxFlat

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	fill.bg_color = Color(0.608, 0.816, 0.49, 1.0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	value -= 0.15
	
	if value == 67:
		fill.bg_color = Color(0.94, 0.692, 0.343, 1.0)
	elif value == 43:
		fill.bg_color = Color(0.81, 0.274, 0.295, 1.0)
