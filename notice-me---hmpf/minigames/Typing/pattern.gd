extends Control


@export var satz_1: Array
@export var satz_2: Array

@onready var label = $Label
@onready var pati = $"../Pati"
@onready var timer = $"../Timer"
@onready var end_label = $"../End"

var input_enabled = true
var current_letter_index = 0
var finished = false
var max_letters = 0
var misspell = 0
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = atoStr(satz_1)
	label.show()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Turn array of String into one String
func atoStr(satz: Array) -> String:
	var output = ""
	
	for element in satz:
		output = output + element
		max_letters += 1
	return output


func _input(event):
	if not input_enabled: return
	
	if timer_done():
			label.hide()
			end_label.text = "Deine Genauigkeit: " + str(score) + "%"
			end_label.show()
			input_enabled = false
	
	if event is InputEventKey and event.pressed and not event.echo:
		var key_name = OS.get_keycode_string(event.keycode)
		var letter = label.text[current_letter_index]
	
		if key_name == letter:
			pati.correct()
			print("Richtig!")
		else:
			pati.incorrect()
			timer.reduce_timer()
			misspell += 1
			print("Falsch!")
		current_letter_index += 1
		
		if pattern_finished():
			label.hide()
			end_label.text = "Deine Genauigkeit: " + str(score) + "%"
			end_label.show()
			timer.set_process(false)
			input_enabled = false

func pattern_finished():
	if current_letter_index >= label.text.length():
		print("String abgeschlossen!")
		score = (max_letters - misspell) / max_letters * 100
		if score < 0:
			score = 0
		return true

func timer_done():
	if timer.value <= 0:
		return true
