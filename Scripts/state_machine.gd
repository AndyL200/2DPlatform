class_name StateMachine
extends Node

@export var initial_state: State

var current_state: State
var states: Dictionary[String, State] = {}

func _ready() -> void:
	# Add all child nodes of type state as potential states
	for state in get_children():
		if state is State:
			states[state.name.to_lower()] = state
			state.Transition.connect(on_transition)
	
	if initial_state:
		initial_state.on_enter()
		current_state = initial_state

func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)

func on_transition(current_state: State, next_state: String):
	if self.current_state != current_state:
		return # Only the current state can request to transition
	
	var new_state = states.get(next_state.to_lower())
	if !new_state:
		return # Do nothing if the requested state doesn't exist
	
	if self.current_state:
		self.current_state.on_exit()
	new_state.on_enter()
	self.current_state = new_state
