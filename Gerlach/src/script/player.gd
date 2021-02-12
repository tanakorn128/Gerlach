extends KinematicBody2D
var velocity : Vector2
const speed = 10000
var isAttacking = false
var flip_h_isAttacking=false
func _ready():
	#Events.connect("player_speed",self,"player_speed")
	set_player_position()
	$"/root/Global".player = self.position
	player_position()
	pass

func _process(delta):
	if Input.is_action_pressed("ui_left") && isAttacking == false:
		player_position()
		velocity.y = 0
		velocity.x = -speed
		flip_h_isAttacking = false
		$AnimatedSprite.play("left")
		Events.emit_signal("player_Collisioion_mission",true)
		player_position()
	elif Input.is_action_pressed("ui_right") && isAttacking == false:
		player_position()
		velocity.y = 0
		velocity.x = +speed
		flip_h_isAttacking = true
		$AnimatedSprite.play("right")
		Events.emit_signal("player_Collisioion_mission",true)
		player_position()
	elif Input.is_action_pressed("ui_down") && isAttacking == false:
		player_position()
		velocity.x = 0
		velocity.y = +speed
		$AnimatedSprite.play("down")
		Events.emit_signal("player_Collisioion_mission",true)
		player_position()
	elif Input.is_action_pressed("ui_up") && isAttacking == false:
		player_position()
		velocity.x = 0
		velocity.y = -speed
		$AnimatedSprite.play("up")
		player_position()
		Events.emit_signal("player_Collisioion_mission",true)
	else:
		velocity.x = 0
		velocity.y = 0
		if isAttacking == false:
			$AnimatedSprite.play("idle")
			Events.emit_signal("player_Collisioion_mission",false)
			player_position()
	
	
	if Input.is_action_pressed("attack"):
		$AnimatedSprite.flip_h = flip_h_isAttacking
		if isAttacking == false:
			$AnimationPlayer.play("attack2")
		if isAttacking == true:
			$AnimationPlayer.play("attack")
		$AnimatedSprite.play("attack1")
		isAttacking = true
	move_and_slide(velocity*delta)
	pass

func player_position():
	Events.emit_signal("player_position",self.position)
	pass



func set_player_position():
	self.position = $"/root/Global".player
	pass

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "attack1":
		$AnimatedSprite.flip_h = false
		isAttacking = false
	pass # Replace with function body.


func _on_Timer_timeout():
	$CollisionShape2D.disabled = false
	pass # Replace with function body.
