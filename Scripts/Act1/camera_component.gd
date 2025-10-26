class_name CameraComponent
extends Node

@export var cam : Camera2D
@export var anchor : Node2D

var zoom = Vector2(1.5,1.5)
var offset = Vector2(0,-100)

func _ready() -> void:
	cam.position = anchor.position
	cam.offset = offset
	cam.zoom = zoom
func _process(delta: float) -> void:
	cam.position = anchor.position
