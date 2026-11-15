extends Node2D

@export var normal_texture: Texture2D
@export var click_texture: Texture2D
@export var win_texture: Texture2D
@export var lose_texture: Texture2D

@onready var sprite = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.texture = normal_texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		sprite.texture = click_texture 
		await get_tree().create_timer(0.1).timeout 
		sprite.texture = normal_texture

func set_losing_texture():
	sprite.texture = lose_texture

func set_winning_texture():
	sprite.texture = win_texture
