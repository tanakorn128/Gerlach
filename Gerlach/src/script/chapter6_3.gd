extends Node2D
export (bool) var test
var area:bool = false
func _ready():
	if test && not $"/root/Global".test:
		$"/root/Global".player_pos = Vector2(-9758.69,-353.975)
		$"/root/Global".test = true
	else:
		$player.position = $"/root/MissionInventory"._save_player.position
	lable("chapter6_3_DB1")
	$"/root/Global".chapter = "chapter6"
	$postbox/Timer.start()
	$"/root/MissionInventory"._save_player.chapter = 11

func _process(delta):
	$"/root/MissionInventory"._save_player.position = $player.position

func _on_7_4_body_entered(body):
	if body.get_name() == "player":
		$"/root/MissionInventory"._save_player.position = Vector2(98.605,4593.452)
		$"/root/Scene".scene(14)
	pass # Replace with function body.

func lable(value:String):
	$"/root/Global"._dialogbox = value
	if $dialogbox._dialogbox(true):
		$"/root/Global".player_pos = $player.position
		$dialogbox.show()
		$dialogbox.position.x = $player.position.x -660
		$dialogbox.position.y = $player.position.y + 120
		$dialogbox._dialogbox(true)


func _on_postbox_body_entered(body):
	$"/root/Global".scene = 11
	if body.get_name() == "player" && area:
		Events.emit_signal("postbox")
		get_tree().change_scene("res://src/scene/postbox.tscn")
	
	pass # Replace with function body.


func _on_Timer_timeout():
	area = true
	$postbox/Timer.stop()
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if body.get_name() == "player":
		$"/root/MissionInventory"._save_player.position = Vector2(1358.47,2512.1)
		get_node("/root/Scene").scene(21)
	pass # Replace with function body.
