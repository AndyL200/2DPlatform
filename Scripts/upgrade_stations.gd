class_name Upgrade
extends Sprite2D

@export var upgrade : String
@onready var processingInput := false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if processingInput:
		processInput()
	pass
func processInput() -> void:
	if Input.is_action_just_pressed("Interact"):
		GameManager.apply_upgrade(upgrade)

func _on_upgrade_collide_body_entered(body: Node2D) -> void:
	if body is MC:
		processingInput = true
	pass # Replace with function body.


func _on_upgrade_collide_body_exited(body: Node2D) -> void:
	if body is MC:
		processingInput = false
	pass # Replace with function body.
