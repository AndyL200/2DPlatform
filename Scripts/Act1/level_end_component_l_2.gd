extends LevelEndComponent

signal sub_end

func reposition(pos : Vector2) -> void:
	player.position = pos
	print(pos)

func _on_sub_area_body_entered(body: Node2D) -> void:
	if body == player:
		sub_end.emit()
	pass # Replace with function body.


func _on_level_end_body_entered(body: Node2D) -> void:
	if body == player:
		t_comp.transition()
		await t_comp.on_transition_finished
		change_level.emit(1)
	pass # Replace with function body.
