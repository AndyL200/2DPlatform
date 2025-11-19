extends Level

@export var cam : CameraComponent
@onready var subtexture = preload("res://Assets/Custom/bckgda1level2.png")



#override in godot??
func _on_level_end_component_l_2_sub_end() -> void:
	GameManager.halt()
	var vp_r = cam.vp_c.rect
	remove_child($TileMapLayer)
	cam.vp_c.changeTexture(subtexture);
	$LevelEndComponentL2.reposition(Vector2(vp_r.size.x/2, 0))
	#has a scale of 2
	cam.cam.position = Vector2(vp_r.size.x/2, 0)
	cam.slow_zoom(Vector2(1,1), 1)
	cam.limit_set(vp_r.position.x, vp_r.position.y, vp_r.size.x, vp_r.size.y)
	GameManager.resume()
	$LevelEndComponentL2/level_end.monitoring = true
	$LevelEndComponentL2/level_end.monitorable = true
	pass # Replace with function body.


func _on_level_end_component_l_2_change_level(i: int) -> void:
	level_end.emit(self, i)
	pass # Replace with function body.
