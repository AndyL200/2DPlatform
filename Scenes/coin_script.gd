extends CharacterBody2D
@export var audio : AudioStreamPlayer

func _on_coin_area_body_entered(body: Node2D) -> void:
	if body.has_method("coin_pick_up"):
		body.coin_pick_up()
		audio.play()
		await audio.finished
		queue_free()
	pass # Replace with function body.
