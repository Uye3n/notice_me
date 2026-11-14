extends Node
var character_name: String
var trust_scale: int
var likes = []					# Array of items character likes
var dislikes = []				# Array of items character dislikes
var poses = {} 					# Dictionary for different poses with their corresponding img path?
@export var big_change: int
@export var small_change: int


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	trust_scale = 50
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Called whenever player does something to increase target's trust scale 
func _increase_trust(points: int) -> void:
	trust_scale += points
	pass

# Called whenever player does something to decrease target's trust scale lol
func _decrease_trust(points: int) -> void:
	trust_scale -= points
	pass
