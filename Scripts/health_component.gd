class_name HealthComponent
extends Node2D

var health : int

func Heal(amount : int):
	health += amount
func Damage(amount : int):
	health -= amount
