class_name ViewportComponent
extends Node

@export var texture_rect : TextureRect

func changeTexture(t : Texture2D) -> void:
	texture_rect.texture = t
	
