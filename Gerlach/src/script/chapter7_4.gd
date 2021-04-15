extends Node2D
var area:bool = false
export (bool) var test

func _ready():
	if test && not $"/root/Global".test:
		$"/root/Global".player_pos = Vector2(98.605,4593.452)
		$"/root/Global".test = true
	else:
		$player.position = $"/root/MissionInventory"._save_player.position
	$postbox2/Timer.start()

func _process(delta):
	$"/root/MissionInventory"._save_player.position = $player.position

func _on_next_chapter_body_entered(body):
	if body.get_name() == "player":
		$"/root/MissionInventory"._save_player.position = Vector2(7376.69,-1458.58)
		$"/root/Scene".scene(15)
	pass # Replace with function body.


func _on_postbox2_body_entered(body):
	$"/root/Global".scene = 14
	if body.get_name() == "player" && area:
		Events.emit_signal("postbox")
		get_tree().change_scene("res://src/scene/postbox.tscn")
	pass # Replace with function body.


func _on_Timer_timeout():
	area = true
	$postbox2/Timer.stop()
	pass # Replace with function body.
