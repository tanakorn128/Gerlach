extends Node2D

func _ready():
	Events.connect("player_position",self,"player_position")
	pass

func player_position(position):
	$HUD.position.x = position.x+700
	$HUD.position.y = position.y+700
	
	pass
