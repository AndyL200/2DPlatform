class_name ViewportComponent
extends Node2D

@export var texture_rect : TextureRect

@onready var vp = get_viewport()
@onready var rect = get_viewport_rect()


func changeTexture(t : Texture2D) -> void:
	if texture_rect:
		texture_rect.texture = t
