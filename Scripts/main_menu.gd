extends Control

@onready var arrow = $Arrows
@onready var menuItems = [$Start, $Quit, $Credits]
@onready var curItem = 0
@onready var menuSize = 3
@onready var spacing = 25
@onready var rootScene = preload("res://Scenes/root.tscn")


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		curItem = (curItem + menuSize - 1) % menuSize
		var l = menuItems[curItem]
		arrow.position = l.position - Vector2.RIGHT * spacing
	elif Input.is_action_just_pressed("ui_down"):
		curItem = (curItem + 1) % menuSize
		var l = menuItems[curItem]
		arrow.position = l.position - Vector2.RIGHT * spacing
		
	if Input.is_action_just_pressed("ui_accept"):
		var item = menuItems[curItem]
		if item == $Start:
			get_tree().change_scene_to_packed(rootScene)
		elif item == $Quit:
			get_tree().quit()
		else:
			get_tree().change_scene_to_packed(GameManager.creditsScene)
