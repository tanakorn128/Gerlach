extends KinematicBody2D
var velocity : Vector2
const speed = 10000
var isAttacking = false
var flip_h_isAttacking=false
onready var animation_tree = get_node("AnimationTreePlayer")
onready var animation_node = animation_tree.get("parameters")

func _ready():
	#Events.connect("player_speed",self,"player_speed")
	Events.connect("heart",self,"heart")
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
		animation_tree.set("parameters/Transition/current",1)
		animation_tree.set("parameters/walk/blend_position",Vector2(-1,0).normalized())
		Events.emit_signal("player_Collisioion_mission",true)
		player_position()
	elif Input.is_action_pressed("ui_right") && isAttacking == false:
		player_position()
		velocity.y = 0
		velocity.x = +speed
		flip_h_isAttacking = true
		animation_tree.set("parameters/Transition/current",1)
		animation_tree.set("parameters/walk/blend_position",Vector2(1,0).normalized())
		Events.emit_signal("player_Collisioion_mission",true)
		player_position()
	elif Input.is_action_pressed("ui_down") && isAttacking == false:
		player_position()
		velocity.x = 0
		velocity.y = +speed
		animation_tree.set("parameters/Transition/current",1)
		animation_tree.set("parameters/walk/blend_position",Vector2(0,-1).normalized())
		Events.emit_signal("player_Collisioion_mission",true)
		player_position()
	elif Input.is_action_pressed("ui_up") && isAttacking == false:
		player_position()
		velocity.x = 0
		velocity.y = -speed
		animation_tree.set("parameters/Transition 2/current",1)
		animation_tree.set("parameters/walk/blend_position",Vector2(0,1).normalized())
		player_position()
		Events.emit_signal("player_Collisioion_mission",true)
	else:
		velocity.x = 0
		velocity.y = 0
		animation_tree.set("parameters/Transition 2/current",1)
		animation_tree.set("parameters/walk/blend_position",Vector2(0,0).normalized())
		if isAttacking == false:
			Events.emit_signal("player_Collisioion_mission",false)
			player_position()
	move_and_slide(velocity*delta)
	attack()
	pass

func player_position():
	Events.emit_signal("player_position",self.position)
	pass

func attack():
	if Input.is_action_pressed("attack"):
		animation_tree.set("parameters/Transition/current",0)
		animation_tree.set("parameters/attack/blend_position",Vector2(-1,0).normalized())
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
