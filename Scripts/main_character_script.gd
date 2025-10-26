class_name MC
extends CharacterBody2D

@export_category("Movement")
@export var moveSpeed = 150.0
@export var stepHeight = 25
@export var jumpHeight = 300.0
@export var deceleration : Vector2 = Vector2(3,2)
@export var jumpCount := 2
@export_category("Components")
@export var hurtBox : HurtBoxComponent
@export var velocityComponent : VelocityComponent
@export_category("Animations")
@export var animations : AnimationPlayer
@export_category("Wall Jump Variable")
@export var wall_slide = 10
@onready var left_ray : RayCast2D = $Raycast/left
@onready var right_ray : RayCast2D = $Raycast/right
#push off walls
@export var wallForce : Vector2 = Vector2(200.0,-220.0)
var is_wall_jumping = false

var movement = Vector2()

func horizontal_movement(delta : float):
	#assuming we have a controller?
	var moving = true;
	if Input.is_action_pressed("Right"):
		movement = Vector2.RIGHT
	elif Input.is_action_pressed("Left"):
		movement = Vector2.LEFT
	else:
		moving = false
	if moving:
		velocityComponent.vel.x = movement.x * moveSpeed
		#velocityComponent.vel.y -= movement.y * stepHeight
	else:
		velocityComponent.vel.x = move_toward(velocityComponent.vel.x, 0, deceleration.x)
		
func verticalMovement(delta : float) -> void:
	if is_on_wall_only():
		wallLogic()
	else:
		jumpLogic()
	if not is_on_floor():
		velocityComponent.gravity(delta)
	pass
	
func wallLogic() -> void:
	velocity.y = 10
	jumpCount = 1
	if Input.is_action_just_pressed("Jump"):
		if left_ray.is_colliding():
			velocityComponent.vel = wallForce
		if right_ray.is_colliding():
			velocityComponent.vel = Vector2(-wallForce.x, wallForce.y)
	pass
func jumpLogic() -> void:
	
	var jumping = Input.is_action_just_pressed("Jump")
	if jumping:
		if is_on_floor():
			jumpCount = 2;
			velocityComponent.vel.y = Vector2.UP.y * jumpHeight
			jumpCount -= 1
		elif not is_on_floor():
			if jumpCount > 0:
				velocityComponent.vel.y = Vector2.UP.y * jumpHeight
				jumpCount -= 1
	if Input.is_action_just_released("Jump"):
			velocityComponent.vel.y = lerp(velocityComponent.vel.y, velocityComponent.g, 0.2)
			velocityComponent.vel.y *= 0.3
	else:
		return	
func set_animation():
	if is_on_floor():
		if velocityComponent.vel.x == 0 and velocityComponent.vel.y == 0:
			$AnimationPlayer.play("idle")
		elif velocityComponent.vel.x != 0:
			$AnimationPlayer.play("move")
	else:
		if velocityComponent.vel.y > 0:
			$AnimationPlayer.play("jump")
		elif velocityComponent.vel.y < 0:
			$AnimationPlayer.play("fall")
	
		
func ready() -> void:
	pass
	
	
func flip() -> void:
	if velocity.x > 0.0:
		scale.x = scale.y * 1
	elif velocity.x < 0.0:
		scale.x = scale.y * -1
		
		
func _physics_process(delta: float) -> void:
	velocity = velocityComponent.vel
	horizontal_movement(delta)
	verticalMovement(delta)
	
	flip()
	set_animation()
	#velocityComponent.gravity()
	#TODO(get slide collisions) 
	move_and_slide()
	pass

func handleCollisions() -> void:
	pass
