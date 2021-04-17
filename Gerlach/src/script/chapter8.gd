extends Node2D
export (bool) var test
var area:bool = false

func _ready():
	if test && not $"/root/Global".test:
		$"/root/Global".player_pos = Vector2(-11.914,604.567)
		$"/root/Global".test = true
	else:
		$player.position = $"/root/MissionInventory"._save_player.position
	lable("chapter8_DB1")
	$"/root/MissionInventory"._save_player.chapter = 17
	$"/root/Global"._Exam = 3
	$"/root/Global".chapter = "chapter8"
	$put_Enemy_Chapter8.putenemy()
	$postbox/Timer.start()
func _process(delta):
	$"/root/MissionInventory"._save_player.position = $player.position
	finished()

func lable(value:String):
	$"/root/Global"._dialogbox = value
	if $dialogbox._dialogbox(true):
		$"/root/Global".player_pos = $player.position
		$dialogbox.show()
		$dialogbox.position.x = $player.position.x -660
		$dialogbox.position.y = $player.position.y + 120
		$dialogbox._dialogbox(true)

var DB2:bool = false
func finished():
	if $put_Enemy_Chapter8._Enemy <= 0 && not DB2:
		lable("chapter8_DB2")
		DB2 = true



func _on_postbox_body_entered(body):
	$"/root/Global".scene = 17
	if body.get_name() == "player" && area:
		Events.emit_signal("postbox")
		get_tree().change_scene("res://src/scene/postbox.tscn")
	pass # Replace with function body.


func _on_Timer_timeout():
	area = true
	$postbox/Timer.stop()
	pass # Replace with function body.
