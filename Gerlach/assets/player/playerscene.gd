extends Node2D

export (Resource) var player

func _ready():
	$"/root/Global".player_pos = player.position
