extends Node2D

@onready var speed: float = 50.0
@onready var dist_to_travel: float = 200.0

var direction = 1
var dist_traveled = 0.0

func _process(delta: float) -> void:
	dist_traveled += speed*delta
	if dist_traveled >= dist_to_travel:
		direction *= -1
		dist_traveled = 0
	position += Vector2.RIGHT * direction * speed * delta
	
