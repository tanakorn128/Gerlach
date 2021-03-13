extends KinematicBody2D
var velocity : Vector2
var speed = 10000
var isAttacking = false
var flip_h_isAttacking=false
onready var animation_tree = get_node("AnimationTreePlayer")
onready var animation_node = animation_tree.get("parameters")
onready var playback = $AnimationTreePlayer.get("parameters/StateMachine/playback")
func _ready():
	#Events.connect("player_speed",self,"player_speed")
	Events.connect("heart",self,"heart")
	Events.connect("player_position",self,"player_pos")
	Events.connect("player_Camera2D",self,"player_Camera2D")
	#set_player_position()
	$"/root/Global".player = self.position
	player_position()
	playback.start("attackLeft")
	pass

func _process(delta):
	if Input.is_action_pressed("ui_select"):
		speed = 20000
		Animation_Player("run")
	else:
		speed = 10000
		Animation_Player("walk")
	move_and_slide(velocity*delta)
	pass

func player_position():
	Events.emit_signal("player_position",self.position)
	pass

func Animation_Player(value):
	if value == "run":
		animation_tree.set("parameters/Transition/current",2)
		if Input.is_action_pressed("ui_left") && isAttacking == false:
			player_position()
			velocity.y = 0
			velocity.x = -speed
			flip_h_isAttacking = false
			animation_tree.set("parameters/run/blend_position",Vector2(-1,0).normalized())
			Events.emit_signal("player_Collisioion_mission",true)
			player_position()
		elif Input.is_action_pressed("ui_right") && isAttacking == false:
			player_position()
			velocity.y = 0
			velocity.x = +speed
			flip_h_isAttacking = true
			animation_tree.set("parameters/run/blend_position",Vector2(1,0).normalized())
			Events.emit_signal("player_Collisioion_mission",true)
			player_position()
		elif Input.is_action_pressed("ui_down") && isAttacking == false:
			player_position()
			velocity.x = 0
			velocity.y = +speed
			animation_tree.set("parameters/run/blend_position",Vector2(0,-1).normalized())
			Events.emit_signal("player_Collisioion_mission",true)
			player_position()
		elif Input.is_action_pressed("ui_up") && isAttacking == false:
			player_position()
			velocity.x = 0
			velocity.y = -speed
			animation_tree.set("parameters/run/blend_position",Vector2(0,1).normalized())
			player_position()
			Events.emit_signal("player_Collisioion_mission",true)
		else:
			velocity.x = 0
			velocity.y = 0
			animation_tree.set("parameters/run/blend_position",Vector2(0,0).normalized())
			if isAttacking == false:
				Events.emit_signal("player_Collisioion_mission",false)
				player_position()
		pass
	if value == "walk":
		animation_tree.set("parameters/Transition/current",1)
		if Input.is_action_pressed("ui_left") && isAttacking == false:
			player_position()
			velocity.y = 0
			velocity.x = -speed
			flip_h_isAttacking = false
			animation_tree.set("parameters/walk/blend_position",Vector2(-1,0).normalized())
			Events.emit_signal("player_Collisioion_mission",true)
			player_position()
			attack("left")
		elif Input.is_action_pressed("ui_right") && isAttacking == false:
			player_position()
			velocity.y = 0
			velocity.x = +speed
			flip_h_isAttacking = true
			animation_tree.set("parameters/walk/blend_position",Vector2(1,0).normalized())
			Events.emit_signal("player_Collisioion_mission",true)
			player_position()
			attack("right")
		elif Input.is_action_pressed("ui_down") && isAttacking == false:
			player_position()
			velocity.x = 0
			velocity.y = +speed
			animation_tree.set("parameters/walk/blend_position",Vector2(0,-1).normalized())
			Events.emit_signal("player_Collisioion_mission",true)
			player_position()
			attack("down")
		elif Input.is_action_pressed("ui_up") && isAttacking == false:
			player_position()
			velocity.x = 0
			velocity.y = -speed
			animation_tree.set("parameters/walk/blend_position",Vector2(0,1).normalized())
			player_position()
			attack("up")
			Events.emit_signal("player_Collisioion_mission",true)
		else:
			velocity.x = 0
			velocity.y = 0
			animation_tree.set("parameters/walk/blend_position",Vector2(0,0).normalized())
			attack("idle")
			if isAttacking == false:
				Events.emit_signal("player_Collisioion_mission",false)
				player_position()
func attack(value):
	if Input.is_action_pressed("attack"):
		if value == "left":
			animation_tree.set("parameters/attacks_Blend2/blend_amount",0)
			animation_tree.set("parameters/Transition/current",0)
			animation_tree.set("parameters/attacks_walk/blend_position",Vector2(-1,0).normalized())
			animation_tree.set("parameters/attacks/blend_position",Vector2(-1,0).normalized())
		if value == "right":
			animation_tree.set("parameters/attacks_Blend2/blend_amount",0)
			animation_tree.set("parameters/Transition/current",0)
			animation_tree.set("parameters/attacks_walk/blend_position",Vector2(1,0).normalized())
			animation_tree.set("parameters/attacks/blend_position",Vector2(1,0).normalized())
		if value == "up":
			animation_tree.set("parameters/attacks_Blend2/blend_amount",0)
			animation_tree.set("parameters/Transition/current",0)
			animation_tree.set("parameters/attacks_walk/blend_position",Vector2(0,1).normalized())
			animation_tree.set("parameters/attacks/blend_position",Vector2(0,1).normalized())
		if value == "down":
			animation_tree.set("parameters/attacks_Blend2/blend_amount",0)
			animation_tree.set("parameters/Transition/current",0)
			animation_tree.set("parameters/attacks_walk/blend_position",Vector2(0,-1).normalized())
			animation_tree.set("parameters/attacks/blend_position",Vector2(0,-1).normalized())
		if value == "idle":
			
			animation_tree.set("parameters/Transition/current",0)
			animation_tree.set("parameters/attacks_walk/blend_position",Vector2(0,0).normalized())
			#animation_tree.set("parameters/attacks/blend_position",Vector2(0,0).normalized())
			animation_tree.set("parameters/attacks_Blend2/blend_amount",1)
			playback.travel("attackdown")
			
	pass

func set_player_position():
	self.position = $"/root/Global".player
	pass

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "attack1":
		$AnimatedSprite.flip_h = false
		isAttacking = false
	pass # Replace with function body.

func heart():
	$Particles2D_heart.emitting = true
	$heart.start()
	pass

func _on_Timer_timeout():
	$CollisionShape2D.disabled = false
	pass # Replace with function body.


func _on_heart_timeout():
	$Particles2D_heart.emitting = false
	$heart.start()
	pass # Replace with function body.

func player_pos(pos):
	self.position = pos
	pass

func player_Camera2D(settings):
	if settings:
		$Camera2D.current = true
	else:
		$Camera2D.current = false
	print(settings)
	pass
