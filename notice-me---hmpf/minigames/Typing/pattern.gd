extends Control

@export var satz_1: Array
@export var satz_2: Array

@onready var label = $Label

var current_letter_index = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = atoStr(satz_1)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Turn array of String into one String
func atoStr(satz: Array) -> String:
	var output = ""
	
	for element in satz:
		output = output + element
	return output


func _input(event):
	if event is InputEventKey and event.pressed and not event.echo:
		var key_name = OS.get_keycode_string(event.keycode)
		var letter = label.text[current_letter_index]
	
		if key_name == letter:
			print("Richtig!")
		else:
			print("Falsch!")
		current_letter_index += 1
	
		if current_letter_index >= label.text.length():
			print("String abgeschlossen!")
			current_letter_index = 0
