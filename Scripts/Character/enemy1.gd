extends Enemy

@export var anim : AnimationPlayer



func _ready() -> void:
	attack_ray = atk.attack_ray
	return

func vertical_movement(delta : float) -> void:
	if not is_on_floor():
		velc.gravity(delta)
	return
func horizontal_movement(delta : float) -> void:
	return

#called by state machine
func attack() -> void:
	var d = atk.damage
	attack_ray.rotation = rotation + 90
	curr_anim = "attack"
	if attack_ray.is_colliding():
		var collide = attack_ray.get_collider()
		if collide and collide is MC:
			var h = collide.get_children().filter(func(node): return node is HealthComponent)
			if h.size() > 0:
				h[0].Damage(d)
func set_animation(animation : String = curr_anim) -> void:
	if animation == "_":
		return
	if animation == "":
		if is_on_floor():
			if velocity.x == 0 and velocity.y == 0:
				anim.play("idle")
			elif velocity.x != 0:
				if velocity.x < 0:
					anim.play("left")
				elif velocity.x > 0:
					anim.play("right")
				#sound_c.play("walk")
	else:
		anim.play(animation)
		#if animation == "attack":
			#sound_c.play("attack")
		await anim.animation_finished
		curr_anim = ""
	return
func _physics_process(delta: float) -> void:
	velocity = velc.vel
	vertical_movement(delta)
	horizontal_movement(delta)
	set_animation(curr_anim)
	print(health.health)
	move_and_slide()


func _on_health_component_death() -> void:
	anim.play("death")
	curr_anim = "_"
	#await get_tree().create_timer(0.5).timeout
	await anim.animation_finished
	queue_free()
	pass # Replace with function body.
