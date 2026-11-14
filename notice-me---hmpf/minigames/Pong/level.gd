extends Node2D


var score_player = 0
var score_pong = 0

@onready var ball = $Ball
@onready var label_player = $"CanvasLayer/Control/Player Score"
@onready var label_pong = $"CanvasLayer/Control/Pong Score"

# Called when the node enters the scene tree for the first time.
func _ready():
	ball.out_of_bounds.connect(_on_ball_out_of_bounds)
	
	new_game()

func check_win_cond():
	pass

func update_score_display():
	label_player.text = "Du: " + str(score_player)
	label_pong.text = "Pong: " + str(score_pong)

func new_game():
	score_player = 0
	score_pong = 0
	update_score_display()
	ball.start()

func _on_ball_out_of_bounds():
	if ball.position.x < get_viewport_rect().size.x / 2:
		score_pong += 1
	else:
		score_player += 1
	
	update_score_display()
