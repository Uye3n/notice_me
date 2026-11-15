extends Node2D

@onready var timer = $Timer
@onready var progr_bar = $HappinessBar
@onready var win_label = $Result
@onready var sopi_sprite = $ShySophie

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if check_win_cond():
		win_label.show()
		sopi_sprite.set_winning_texture()
	elif check_losing_cond():
		win_label.text = "Eine einsame Träne läuft Sophies Wange entlang..."
		win_label.show()
		sopi_sprite.set_losing_texture()

func check_win_cond():
	if progr_bar.value == 1000 and timer.value != 0:
		timer.set_process(false)
		return true

func check_losing_cond():
	if timer.value == 0:
		timer.set_process(false)
		return true
