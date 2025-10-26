class_name level_end_component
extends Node

#when the end of a level is reached, some kind of transition should occur
@export var t_comp : TransitionComponent
@export var player : CharacterBody2D
signal level_end




func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == player:
		level_end.emit()
		t_comp.transition()
	pass # Replace with function body.
