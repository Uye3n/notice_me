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
		
		set_process(false) 
		select_timeline()
		#f Main.sophie_minigame_count == 2:
			#elect_timeline()
		print("nach label zeug")
		
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

			
func select_timeline():
	match Main.sophie_minigame_count:
		0:
			Main.sophie_minigame_count += 1
			Dialogic.start("sophie2")
		1:
			Main.sophie_minigame_count += 1
			Dialogic.start("sophie3")
			await Dialogic.timeline_ended
			Dialogic.start("sophie_ending")
		_:
			Dialogic.start("sophie_ending")
			
