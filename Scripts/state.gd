class_name State
extends Node

signal Transition(current_state: State, next_state: String)

func on_enter() -> void:
	pass
	
func on_exit() -> void:
	pass

func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	pass
