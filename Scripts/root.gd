class_name Root
extends Control


@onready var act = 1
@onready var acts = ["res://Scenes/Act1/act1.tscn", "", ""]
var GameOver : Control

func _ready() -> void:
	GameManager.death_state.connect(respawner)
	GameOver = $GameOver
	remove_child(GameOver)

func act_end(a : ACT) -> void:
	if act > acts.size():
		#end the game
		pass
	remove_child(a)
	act += 1
	var new_act : PackedScene = load(acts[act-1])
	var act_i = new_act.instantiate()
	add_child(act_i)
	act_i.end_act.connect(_on_act_end_act)	

func _on_act_end_act(a: ACT) -> void:
	act_end(a)
	pass # Replace with function body.

func respawner() -> void:
	add_child(GameOver)

func _on_button_pressed() -> void:
	GameManager.respawn.emit()
	remove_child(GameOver)
	pass # Replace with function body.


func _on_button_2_pressed() -> void:
	GameManager.quit()
	remove_child(GameOver)
	pass # Replace with function body.
