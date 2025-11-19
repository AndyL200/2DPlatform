class_name HealthComponent
extends Node2D

@export var health : int
@export var limit : int
signal death

func Heal(amount : int):
	if health + amount <= limit:
		health += amount
	else:
		health = limit
func Damage(amount : int):
	health -= amount
	if health <= 0:
		death.emit()
