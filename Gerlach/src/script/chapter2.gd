extends Node2D

func _ready():
	$"/root/Global".scene = 2
	Events.emit_signal("player_position",$player.position)
