extends KinematicBody2D
var velocity : Vector2
var speed = 10000
export (bool) var walk
onready var res = $"/root/Player".player
onready var animation_tree = get_node("AnimationTreePlayer")
onready var animation_node = animation_tree.get("parameters")
onready var playback = $AnimationTreePlayer.get("parameters/StateMachine/playback")

func _ready():
	if $"/root/Player".player.hp <= 0:
		get_tree().change_scene("res://src/scene/Menu.tscn")
	playback.start("attackLeft")
	_load()

func _physics_process(delta):
	walk = $"/root/Global".playerwalk
	if Input.is_action_pressed("ui_select") && walk:
		speed = 20000
		Animation_Player("run")
		move_and_slide(velocity*delta)
	elif walk && walk:
		speed = 10000
		Animation_Player("walk")
		move_and_slide(velocity*delta)
	
	
func _load():
	$HUD/TextureProgress.value = res.hp
	pass
func _save():
	#ResourceSaver.save("user://save_01.tres",new_save)
	pass
func Animation_Player(value:String):
	if value == "run":
		Transition(2)
		if Input.is_action_pressed("ui_left"):
			attacks_run(Vector2(-speed,0),Vector2(-1,0))
		elif Input.is_action_pressed("ui_right"):
			attacks_run(Vector2(speed,0),Vector2(1,0))
		elif Input.is_action_pressed("ui_down"):
			attacks_run(Vector2(0,speed),Vector2(0,-1))
		elif Input.is_action_pressed("ui_up"):
			attacks_run(Vector2(0,-speed),Vector2(0,1))
		else:
			attacks_run(Vector2(0,0),Vector2(0,0))

	if value == "walk":
		Transition(1)
		if Input.is_action_pressed("ui_left"):
			attacks_walk(Vector2(-speed,0),Vector2(-1,0),"left")
		elif Input.is_action_pressed("ui_right"):
			attacks_walk(Vector2(speed,0),Vector2(1,0),"right")
		elif Input.is_action_pressed("ui_down"):
			attacks_walk(Vector2(0,speed),Vector2(0,-1),"down")
		elif Input.is_action_pressed("ui_up"):
			attacks_walk(Vector2(0,-speed),Vector2(0,1),"up")
		else:
			attacks_walk(Vector2(0,0),Vector2(0,0),"idle")

func attack(value):
	if Input.is_action_pressed("attack") && false:
		Transition(0)
		if value == "left":
			animation_tree.set("parameters/attacks_Blend2/blend_amount",0)
			animation_tree.set("parameters/attacks/blend_position",Vector2(-1,0).normalized())
		if value == "right":
			animation_tree.set("parameters/attacks_Blend2/blend_amount",0)
			animation_tree.set("parameters/attacks/blend_position",Vector2(1,0).normalized())
		if value == "up":
			animation_tree.set("parameters/attacks_Blend2/blend_amount",0)
			animation_tree.set("parameters/attacks/blend_position",Vector2(0,1).normalized())
		if value == "down":
			animation_tree.set("parameters/attacks_Blend2/blend_amount",0)
			animation_tree.set("parameters/attacks/blend_position",Vector2(0,-1).normalized())
		if value == "idle":
			animation_tree.set("parameters/attacks_Blend2/blend_amount",1)
			playback.travel("attackdown")

func attacks_walk(Changepos:Vector2,animation:Vector2,attack2:String):
	velocity = Changepos
	animation_tree.set("parameters/walk/blend_position",animation.normalized())
	attack(attack2)
	
func attacks_run(Changepos:Vector2,animation:Vector2):
	velocity = Changepos
	animation_tree.set("parameters/run/blend_position",animation.normalized())

func Transition(transition:int):
	animation_tree.set("parameters/Transition/current",transition)

func hp(value:int):
	$HUD/TextureProgress.value += value

func get_hp():
	return $HUD/TextureProgress.value

func skill():
	$animation.play("skill")
	pass
