class_name VelocityComponent
extends Node2D

var vel : Vector2
var g  = 500


func accelerate(accel):
	vel += accel

func gravity(delta : float):
	#terminal velocity
	if vel.y < 500:
		vel.y += g * delta
