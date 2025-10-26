class_name ACT2
extends ACT



func _ready() -> void:
	levels = act_component.act2_scenes


func _on_level_level_end(l : Level) -> void:
	remove_child(l)
	level += 1
	if level > levels.size():
		act_component.act_end(self)
		return
	var lev = load(levels[level])
	add_child(lev)
	pass # Replace with function body.
