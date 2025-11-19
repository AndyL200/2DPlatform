class_name PatrolState
extends State

@onready var speed: float = 150.0
@onready var dist_to_travel: float = 200.0
@export var body: CharacterBody2D
@export var vel : VelocityComponent

var direction = 1
var dist_traveled: float = 0.0

func on_exit() -> void:
	direction *= -1
	dist_traveled = 0.0

func physics_update(delta: float) -> void:
	dist_traveled += speed*delta
	if dist_traveled >= dist_to_travel:
		Transition.emit(self, "Idle")
	else:
		vel.vel = Vector2.RIGHT * direction * speed


func _on_nav_area_body_entered(body2: Node2D) -> void:
	if body2 is MC:
		Transition.emit(self, "Chase")
	pass # Replace with function body.
