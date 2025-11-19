class_name MC
extends CharacterBody2D

@export_category("Sounds")
@export var sound_c : SoundComponent

@export_category("Movement")
@export var moveSpeed : float
@export var stepHeight : int
var jumpHeight : float
@export var deceleration : Vector2
@export var jumpCount : int

@export_category("Components")
@export var hurtBox : HurtBoxComponent
@export var velocityComponent : VelocityComponent
@export_category("Animations")
@export var animations : AnimationPlayer
var curr_anim = ""
@export_category("Wall Jump Variable")
@export var wall_slide : int
#push off walls
@export var wallForce : Vector2

@export_category("Attack")
@export var atk : AttackComponent


var is_wall_jumping = false
@onready var left_ray : RayCast2D = $Raycast/left
@onready var right_ray : RayCast2D = $Raycast/right

var movement = Vector2()
var startingPos : Vector2
var processing := true

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
	var f = is_on_floor()
	var w = is_on_wall_only()
	if not f and not w:
		velocityComponent.gravity(delta)
	elif f:
		velocityComponent.vel.y = move_toward(velocityComponent.vel.y, 0, deceleration.y)
		
	if w:
		wallLogic()
	else:
		jumpLogic()
	return
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
	return
func set_animation(anim : String = ""):
	if anim == "":
		if is_on_floor():
			if velocityComponent.vel.x == 0 and velocityComponent.vel.y == 0:
				animations.play("idle")
			elif velocityComponent.vel.x != 0:
				animations.play("move")
				sound_c.play("walk")
		else:
			if velocityComponent.vel.y > 0:
				animations.play("jump")
				#sound_c.play("jump")
			elif velocityComponent.vel.y < 0:
				animations.play("fall")
				#sound_c.play("fall")
	else:
		animations.play(anim)
		if anim == "attack":
			sound_c.play("attack")
		await animations.animation_finished
		curr_anim = ""


func ready() -> void:
	await get_tree().process_frame
	startingPos = position
	jumpHeight = GameManager.jump
	GameManager.respawn.connect(respawn)
	GameManager.upgrade.connect(upgrade)
	upgrade()
	pass
func upgrade() -> void:
	atk.damage = GameManager.atk
	jumpHeight = GameManager.jump
func attack() -> void:
	if Input.is_action_just_pressed("Attack"):
		var d = atk.damage
		var attack_ray : RayCast2D = atk.attack_ray
		#accounting for flip logic
		
		curr_anim = "attack"
		if attack_ray.is_colliding():
			var collide = attack_ray.get_collider()
			if collide:
				if collide is Enemy:
					var h = collide.get_children().filter(func(node): return node is HealthComponent)
					if h.size() > 0:
						h[0].Damage(d)
				
func flip() -> void:
	if velocity.x > 0.0:
		scale.x = scale.y * 1
	elif velocity.x < 0.0:
		scale.x = scale.y * -1

func coin_pick_up() -> void:
	GameManager.score += 1
		
func _physics_process(delta: float) -> void:
	if processing:
		velocity = velocityComponent.vel
		horizontal_movement(delta)
		verticalMovement(delta)
		attack()
		flip()
		set_animation(curr_anim)
		#velocityComponent.gravity()
		#TODO(get slide collisions) 
		move_and_slide()
	pass

func handleCollisions() -> void:
	pass

func respawn() -> void:
	position = startingPos
	processing = true

func death() -> void:
	processing = false
	animations.play("death")
	await animations.animation_finished
	GameManager.death_state.emit()
	pass # Replace with function body.
