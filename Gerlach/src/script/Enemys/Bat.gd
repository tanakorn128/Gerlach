extends Node2D
var SPEED = 100
var t = 0.0
var player = false
var player_pos:Vector2
var follow
var speed= 350
var reverse = false
func _ready():
	Events.connect("player_Collisioion_mission",self,"player_Collisioion")
	follow = get_node("Path2D/follow")
func _process(delta):
	if $Path2D/follow.offset >= 956.15:
		reverse = true
	elif $Path2D/follow.offset <= 0:
		reverse = false
	if reverse:
		$Path2D/follow/AnimatedSprite.flip_h = false
	else:
		$Path2D/follow/AnimatedSprite.flip_h = true
		pass
	follow.set_offset(follow.get_offset() +speed * delta)
	$Path2D/follow.rotation = 0
	pass
func player_position(position):
	player_pos = position
	pass

func player_Collisioion(Collisioion):
	player = Collisioion
	pass


func _on_Timer_timeout():
	
	pass # Replace with function body.


func _on_DetectionZone_body_entered(body):
	if player:
		pass
	pass # Replace with function body.
