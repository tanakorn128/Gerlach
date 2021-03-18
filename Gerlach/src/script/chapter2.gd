extends Node2D

func _ready():
	$"/root/Global".scene = 2
	
func _process(delta):
	
	if $player.position.y < $player/Camera2D.limit_top:
		get_tree().change_scene("res://src/scene/chapter3.tscn")
	if $player.position.x < $player/Camera2D.limit_left:
		get_tree().change_scene("res://src/scene/chapter1.tscn")
