extends Node2D

var sophie_minigame_count = 0
var pong_minigame_count = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.start("intro_sequence")
	Dialogic.signal_event.connect(_on_signal)

func quit():
	get_tree().quit()

func _on_signal(signal_passed_in):
	match signal_passed_in:
		"pong_minigame":
			get_tree().change_scene_to_file("res://minigames/Pong/level.tscn")
		"sophie_minigame":
			get_tree().change_scene_to_file("res://minigames/Headpat/level.tscn")
