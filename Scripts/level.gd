class_name Level
extends Node2D

signal level_end(l : Level)

func _on_level_end_component_level_end() -> void:
	level_end.emit(self)
	pass # Replace with function body.
