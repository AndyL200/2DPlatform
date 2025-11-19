class_name CameraComponent
extends Node

@export var cam : Camera2D
@export var anchor : Node2D
@export var vp_c : ViewportComponent

@onready var zoom = GameManager.camZoom
var offset = Vector2(0,0)

var vp_center : Vector2

func limit_set(x0, y0, x, y) -> void:
	cam.limit_left = x0
	cam.limit_top = y0 
	cam.limit_right = x
	cam.limit_bottom = y
func re_zoom():
	cam.zoom = GameManager.camZoom
	
func _ready() -> void:
	await get_tree().process_frame
	var vp_r = vp_c.rect
	limit_set(vp_r.position.x, vp_r.position.y, (vp_r.position.x + vp_r.size.x), (vp_r.position.y + vp_r.size.y))
	cam.zoom = zoom
	cam.position = anchor.position
	cam.offset = offset
	GameManager.upgrade.connect(re_zoom)
	
	vp_center = Vector2((vp_r.position.x + vp_r.size.x)/2, (vp_r.position.y + vp_r.size.y)/2)
	
func slow_zoom(v, f) -> void:
	cam.zoom = cam.zoom.lerp(v, f)
func _process(delta: float) -> void:
	cam.position = anchor.position
	
