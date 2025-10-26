extends Sprite2D


@onready var screen_size = get_viewport_rect().size
@onready var tex_size : Vector2 = texture.get_size()/2


func _process(delta : float) -> void:
	position.x = wrapf(position.x, 0, screen_size.x)
	position.y = wrapf(position.y, 0, screen_size.y)
	queue_redraw()
func _ready() -> void:
	pass	
func _draw() -> void:
	if texture == null:
		return
		
	
	draw_texture(texture, -tex_size)
	
	if position.x + tex_size.x > screen_size.x:
		draw_texture(texture, Vector2(-screen_size.x, 0) - tex_size)
	elif position.x - tex_size.x < 0:
		draw_texture(texture, Vector2(screen_size.x,0) + tex_size)
