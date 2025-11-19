class_name TransitionComponent
extends Node

signal on_transition_finished

@export var transition_control : Control
@export var animation_player : AnimationPlayer

func _ready() -> void:
	transition_control.visible = false
	animation_player.animation_finished.connect(_on_animation_finished)
	
func transition() -> void:
	transition_control.visible = true
	animation_player.play("fade_in")
	
func _on_animation_finished(anim) -> void:
	if anim == "fade_in":
		on_transition_finished.emit()
		animation_player.play("fade_out")
	elif anim == "fade_out":
		transition_control.visible = false
		
		
