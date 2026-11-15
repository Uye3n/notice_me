extends Node2D

@export var normal_texture: Texture2D
@export var right_texture: Texture2D
@export var wrong_texture: Texture2D

@onready var sprite = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.texture = normal_texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Change Texture for 0.1 sec whenever player has a correct input
func correct():
	sprite.texture = right_texture 
	await get_tree().create_timer(0.3).timeout 
	sprite.texture = normal_texture

# Change Texture for 0.1 sec whenever player has an incorrect input
func incorrect():
	sprite.texture = wrong_texture 
	await get_tree().create_timer(0.3).timeout 
	sprite.texture = normal_texture
