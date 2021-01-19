extends KinematicBody2D
var velocity : Vector2
export var speed = 1000

func _ready():
	pass

func _process(delta):
	if Input.is_action_pressed("ui_left"):
		velocity.y = 0
		velocity.x = -speed
		$AnimatedSprite.play("left")
	elif Input.is_action_pressed("ui_right"):
		velocity.y = 0
		velocity.x = +speed
		$AnimatedSprite.play("right")
	elif Input.is_action_pressed("ui_down"):
		velocity.x = 0
		velocity.y = +speed
		$AnimatedSprite.play("down")
	elif Input.is_action_pressed("ui_up"):
		velocity.x = 0
		velocity.y = -speed
		$AnimatedSprite.play("up")
	else:
		velocity.x = 0
		velocity.y = 0
		$AnimatedSprite.play("idle")
	move_and_slide(velocity*delta)
	pass

