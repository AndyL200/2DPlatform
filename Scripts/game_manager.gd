extends Node

#TODO(nothing keeps the character in bounds)
@onready var creditsScene = preload("res://Scenes/credits.tscn")
@onready var menuScene = preload("res://Scenes/main_menu.tscn")
@onready var congratsScene = preload("res://Scenes/congrats.tscn")
signal life_change
signal death_state
signal respawn
signal upgrade


var score := 0
var lives := 3
var camZoom = Vector2(3,3)
var jump = 300.0
var atk = 1

func halt() ->  void:
	get_tree().paused = true

func resume() -> void:
	get_tree().paused = false

func congrats() -> void:
	get_tree().change_scene_to_packed(congratsScene)

func mainMenu() -> void:
	get_tree().change_scene_to_packed(menuScene)

func end_game() -> void:
	get_tree().change_scene_to_packed(creditsScene)
func quit() -> void:
	get_tree().quit()

func lives_decrease() -> void:
	lives -= 1
	if lives <= 0:
		return
	life_change.emit()
func lives_increase() -> void:
	lives += 1
	life_change.emit()

func visualUpgrade():
	camZoom = Vector2(2,2)
	upgrade.emit()
	pass
func atkUpgrade():
	atk += 1
	upgrade.emit()
	pass
func jumpUpgrade():
	jump += 100
	upgrade.emit()
	pass
func apply_upgrade(upgrade : String):
	if 'visual' in upgrade:
		visualUpgrade()
	elif 'atk' in upgrade:
		atkUpgrade()
