class_name NavChaseState
extends State

@export var speed: float = 150.0
@export var body: Enemy
@export var agent: NavigationAgent2D
@export var vel : VelocityComponent


var player: MC
var attacking : bool = false

func on_enter() -> void:
	$ChaseTimer.paused = false
	$NavUpdateTime.paused = false
	$ChaseTimer.start()
	$NavUpdateTime.start()

func physics_update(delta: float) -> void:
	if agent.is_navigation_finished() or attacking:
		return
		
	var dir = body.position.direction_to(agent.get_next_path_position())
	var angle = atan2(dir.y, dir.x)
	dir.y = 0
	vel.vel = dir * speed
	if abs(angle) > 45:
		body.jump()
	if (body.position > agent.target_position - Vector2.LEFT*100 and body.position <= agent.target_position) or (body.position > agent.target_position + Vector2.LEFT*100 and body.position <= agent.target_position):
		attacking = true
		await body.attack()
		attacking = false
	#body.move_and_slide()


func _on_area_2d_body_entered(body2: Node2D) -> void:
	if body2 is MC:
		player = body2
		agent.target_position = player.global_position
	pass # Replace with function body.


func _on_chase_timer_timeout() -> void:
	Transition.emit(self, "Idle")
	pass # Replace with function body.


func _on_nav_update_time_timeout() -> void:
	if player:
		agent.target_position = player.global_position
	pass # Replace with function body.

func on_exit() -> void:
	$ChaseTimer.paused = true
	$NavUpdateTime.paused = true
