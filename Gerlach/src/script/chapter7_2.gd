extends Node2D
export (bool) var test
var area:bool = false

func _ready():
	if test && not $"/root/Global".test:
		$"/root/Global".player_pos = Vector2(7376.69,-1458.58)
		$"/root/Global".test = true
	else:
		$player.position = $"/root/MissionInventory"._save_player.position
	$"/root/MissionInventory"._save_player.chapter = 12
	$"/root/Global".chapter = "chapter7"
	$postbox/Timer.start()


func _process(delta):
	$"/root/MissionInventory"._save_player.position = $player.position

func _on_7_3_body_entered(body):
	if body.get_name() == "player":
		$"/root/MissionInventory"._save_player.position = Vector2(-5638.25,371.941)
		$"/root/Scene".scene(13)
	pass # Replace with function body.



func _on_Timer_timeout():
	area = true
	$postbox/Timer.stop()
	pass # Replace with function body.


func _on_postbox_body_entered(body):
	$"/root/Global".scene = 12
	if body.get_name() == "player" && area:
		Events.emit_signal("postbox")
		get_tree().change_scene("res://src/scene/postbox.tscn")
	pass # Replace with function body.
