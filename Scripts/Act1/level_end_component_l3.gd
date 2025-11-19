extends LevelEndComponent



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == player:
		t_comp.transition()
		await t_comp.on_transition_finished
		change_level.emit(1)
	pass # Replace with function body.
