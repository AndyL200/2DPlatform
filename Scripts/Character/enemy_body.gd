class_name Enemy
extends CharacterBody2D

@export var health : HealthComponent
@export var velc : VelocityComponent
@export var hurt_box : HurtBoxComponent
@export var atk : AttackComponent
var attack_ray : RayCast2D
var curr_anim = ""


func set_animation(animation : String = curr_anim) -> void:
	return
func vertical_movement(delta : float) -> void:
	return
func horizontal_movement(delta : float) -> void:
	return
func attack() -> void:
	return
