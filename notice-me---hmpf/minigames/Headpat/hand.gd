extends Node2D

var original_y: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	original_y = position.y
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var tween = create_tween()
		
		tween.tween_property(self, "position:y", original_y + 20, 0.1)
		tween.tween_property(self, "position:y", original_y, 0.1)
