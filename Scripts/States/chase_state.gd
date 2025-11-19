class_name ChaseState
extends State

@export var speed: float = 300.0
@export var body: CharacterBody2D
var player: MC

func _on_detection_area_body_entered(body: Node2D) -> void:
	if body is MC:
		player = body

func physics_update(delta: float) -> void:
	var dir = body.position.direction_to(player.position)
	body.velocity = dir * speed
	body.move_and_slide()
