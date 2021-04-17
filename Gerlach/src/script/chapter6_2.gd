extends Node2D
export (bool) var test
var area:bool = false
func _ready():
	if test && not $"/root/Global".test:
		$"/root/Global".player_pos = Vector2(4436.206,-2809.88)
		$"/root/Global".test = true
	else:
		$player.position = $"/root/MissionInventory"._save_player.position
	$"/root/MissionInventory"._save_player.chapter = 10
	$"/root/Global".scene = 10
	$"/root/Global".chapter = "chapter6"
	lable("chapter6_2_DB1")
	$postbox/Timer.start()

func _process(delta):
	$"/root/MissionInventory"._save_player.position = $player.position

func _on_6_3_body_exited(body):
	if body.get_name() == "player":
		$"/root/Scene".scene(11)
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
	if body.get_name() == "player" && area:
		$"/root/Global".scene = 10
		Events.emit_signal("postbox")
		get_tree().change_scene("res://src/scene/postbox.tscn")
	pass # Replace with function body.


func _on_6_3_body_entered(body):
	if body.get_name() == "player":
		$"/root/MissionInventory"._save_player.position = Vector2(-9758.69,-353.975)
		$"/root/Scene".scene(11)
	pass # Replace with function body.


func _on_Timer_timeout():
	area = true
	$postbox/Timer.stop()
	pass # Replace with function body.
