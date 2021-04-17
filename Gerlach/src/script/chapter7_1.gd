extends Node2D
var area:bool = false
export (bool) var test

func _ready():
	if test && not $"/root/Global".test:
		$"/root/Global".player_pos = Vector2(1358.47,2512.1)
		$"/root/Global".test = true
	else:
		$player.position = $"/root/MissionInventory"._save_player.position
	$"/root/MissionInventory"._save_player.chapter = 21
	lable("chapter7_1_DB1")
	$"/root/Global".chapter = "chapter7"
	$postbox/Timer.start()

func _process(delta):
	$"/root/MissionInventory"._save_player.position = $player.position

func _on_7_2_body_entered(body):
	if body.get_name() == "player":
		$"/root/MissionInventory"._save_player.position = Vector2(7376.69,-1458.58)
		$"/root/Scene".scene(12)
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
	$"/root/Global".scene = 21
	if body.get_name() == "player" && area:
		Events.emit_signal("postbox")
		get_tree().change_scene("res://src/scene/postbox.tscn")
	pass # Replace with function body.


func _on_Timer_timeout():
	area = true
	$postbox/Timer.stop()
	pass # Replace with function body.
