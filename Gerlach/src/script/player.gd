extends KinematicBody2D
var velocity : Vector2
const speed = 10000
var isAttacking = false
var flip_h_isAttacking=false
onready var animation_tree = get_node("AnimationTree")
onready var animation_node = animation_tree.get("parameters/playback")
func _ready():
	#Events.connect("player_speed",self,"player_speed")
	set_player_position()
	$"/root/Global".player = self.position
	player_position()
	animation_node.start("idle")
	pass

func _process(delta):
	if Input.is_action_pressed("ui_left") && isAttacking == false:
		player_position()
		velocity.y = 0
		velocity.x = -speed
		flip_h_isAttacking = false
		animation_node.travel("left")
		Events.emit_signal("player_Collisioion_mission",true)
		player_position()
	elif Input.is_action_pressed("ui_right") && isAttacking == false:
		player_position()
		velocity.y = 0
		velocity.x = +speed
		flip_h_isAttacking = true
		animation_node.travel("right")
		Events.emit_signal("player_Collisioion_mission",true)
		player_position()
	elif Input.is_action_pressed("ui_down") && isAttacking == false:
		player_position()
		velocity.x = 0
		velocity.y = +speed
		animation_node.travel("down")
		Events.emit_signal("player_Collisioion_mission",true)
		player_position()
	elif Input.is_action_pressed("ui_up") && isAttacking == false:
		player_position()
		velocity.x = 0
		velocity.y = -speed
		animation_node.travel("up")
		player_position()
		Events.emit_signal("player_Collisioion_mission",true)
	else:
		velocity.x = 0
		velocity.y = 0
		if isAttacking == false:
			animation_node.travel("idle")
			Events.emit_signal("player_Collisioion_mission",false)
			player_position()

	move_and_slide(velocity*delta)
	pass
func _input(event):
	if event.is_action_pressed("attack"):
		animation_node.travel("attack1")
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
