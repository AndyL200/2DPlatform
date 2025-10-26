class_name VelocityComponent
extends Node2D

var vel : Vector2
var g  = 500.0


func accelerate(accel):
	vel += accel

func gravity(delta : float):
	vel.y += g * delta
