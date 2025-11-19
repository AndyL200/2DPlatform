class_name Chase_Automata
extends Node


@export var navAgent : NavigationAgent2D
@export var body : CharacterBody2D
var dir : Vector2
var state := "chase"


func _physics_process(delta: float) -> void:
	
	#dir = body.position.direction_to(navAgent.get_next_path_position())
	#body.velocity = dir * body.speed
	#body.move_and_slide()
	
	pass
	
func chaseState() -> void:
	pass
func idleState() -> void:
	
	pass

func _on_chase_timer_timeout() -> void:
	state = "idle"
	idleState()
	pass # Replace with function body.

func _ready() -> void:
	pass
