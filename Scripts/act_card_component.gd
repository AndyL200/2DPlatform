class_name ActCardComponent
extends Node

@export var label : Label
@export var time : Timer
@export var anim : AnimationPlayer

func ready() -> void:
	anim.play("fade_in")
	time.start()

func _on_title_card_timer_timeout() -> void:
	anim.play("fade_out")
