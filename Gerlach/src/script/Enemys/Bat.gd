extends Node2D
var SPEED = 100
var t = 0.0
var player = false
var player_pos:Vector2
func _ready():
	Events.connect("player_position",self,"player_position")
	Events.connect("player_Collisioion_mission",self,"player_Collisioion")

func _process(delta):
	t += delta * 0.4
	#position = position.linear_interpolate(player_pos,t)
	
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
