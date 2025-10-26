class_name HurtBoxComponent
extends Area2D

@export var healthComponent : HealthComponent


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("heal"):
		healthComponent.Heal(body.heal_amount)
	elif body.has_method("damage"):
		healthComponent.Damage(body.damage_amount)
	pass # Replace with function body.
