extends Node2D

var area:bool = false

func _ready():
	$"/root/MissionInventory"._save_player.chapter = 19
	$player.position = $"/root/MissionInventory"._save_player.position
	$postbox/Timer.start()

func _process(delta):
	$"/root/MissionInventory"._save_player.position = $player.position

func _on_Area2D_body_entered(body):
	if body.get_name() == "player":
		$"/root/MissionInventory"._save_player.position = Vector2(3730.11,-3467.36)
		$"/root/Scene".scene(18)
	pass # Replace with function body.


func _on_postbox_body_entered(body):
	$"/root/Global".scene = 19
	if body.get_name() == "player" && area:
		Events.emit_signal("postbox")
		get_tree().change_scene("res://src/scene/postbox.tscn")
	pass # Replace with function body.


func _on_Timer_timeout():
	area = true
	$postbox/Timer.stop()
	pass # Replace with function body.
