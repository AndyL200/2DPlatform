extends ACT

signal end_act(a : ACT)

func _ready() -> void:
	levels = act_component.act1_scenes
	

func _on_level_level_end(l : Level, m : int) -> void:
	remove_child(l)
	l.queue_free()
	level += m
	if level > levels.size():
		act_component.act_end(self)
		return
	var lev_scene : PackedScene = load(levels[level-1])
	var lev : Level = lev_scene.instantiate()
	#connect the lev level_end signal
	add_child(lev)
	#self is inferred
	lev.level_end.connect(_on_level_level_end)
	pass # Replace with function body.
