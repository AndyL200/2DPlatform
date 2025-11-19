extends Level


@export var player : CharacterBody2D
@export var cam : CameraComponent


func _ready() -> void:
	await get_tree().process_frame
	player.position.x = (cam.vp_c.rect.position.x + cam.vp_c.rect.size.x)/2
	player.position.y = 0
	cam.slow_zoom(Vector2(1.5,1.5), 0.2)
	
	#fade in text
	


func _on_level_end_component_change_level(i: int) -> void:
	level_end.emit(self, i)
	pass # Replace with function body.
