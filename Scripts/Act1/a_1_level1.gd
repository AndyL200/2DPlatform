extends Level





func _on_level_end_component_change_level(i: int) -> void:
	level_end.emit(self, i)
	pass # Replace with function body.
