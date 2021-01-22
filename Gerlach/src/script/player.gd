extends KinematicBody2D
var velocity : Vector2
export var speed = 1000

func _ready():
	Events.connect("player_speed",self,"player_speed")
	player_position()
	pass

func _process(delta):
	if Input.is_action_pressed("ui_left"):
		player_position()
		velocity.y = 0
		velocity.x = -speed
		$AnimatedSprite.play("left")
	elif Input.is_action_pressed("ui_right"):
		player_position()
		velocity.y = 0
		velocity.x = +speed
		$AnimatedSprite.play("right")
	elif Input.is_action_pressed("ui_down"):
		player_position()
		velocity.x = 0
		velocity.y = +speed
		$AnimatedSprite.play("down")
	elif Input.is_action_pressed("ui_up"):
		player_position()
		velocity.x = 0
		velocity.y = -speed
		$AnimatedSprite.play("up")
	else:
		velocity.x = 0
		velocity.y = 0
		$AnimatedSprite.play("idle")
	move_and_slide(velocity*delta)
	pass

func player_position():
	Events.emit_signal("player_position",self.position)
	pass

func player_speed(speed_player):
	speed = speed_player
	pass
