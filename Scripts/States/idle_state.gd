class_name IdleState
extends State

@export var wait_time: float = 1.0

func on_enter() -> void:
	get_tree().create_timer(wait_time).timeout.connect(on_timeout)

func on_timeout() -> void:
	Transition.emit(self, "Patrol")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is MC:
		Transition.emit(self, "Chase")
	pass # Replace with function body.
