extends Node2D

func _ready() -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is MC:
		$AnimationPlayer.play("disappear")
		await $AnimationPlayer.animation_finished
		_on_disappear()
	pass # Replace with function body.


func _on_disappear() -> void:
	queue_free()
	pass # Replace with function body.
