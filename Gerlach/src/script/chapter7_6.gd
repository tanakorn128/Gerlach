extends Node2D
export (bool) var test
var area:bool = false
var inst
func _ready():
	if test && not $"/root/Global".test:
		$"/root/Global".player_pos = Vector2(5095.26,-1338.48)
		$"/root/Global".test = true
	else:
		$player.position = $"/root/MissionInventory"._save_player.position
	$"/root/MissionInventory"._save_player.chapter = 16
	$postbox/Timer.start()
	$"/root/Global".chapter = "chapter7"
	$"/root/Global"._Exam = 1

func _process(delta):
	$"/root/MissionInventory"._save_player.position = $player.position
	finished()

func _on_Area2D_body_entered(body):
	if body.get_name() == "player":
		$"/root/Scene".scene(20)
	pass # Replace with function body.


func _on_postbox_body_entered(body):
	$"/root/Global".scene = 16
	if body.get_name() == "player" && area:
		Events.emit_signal("postbox")
		get_tree().change_scene("res://src/scene/postbox.tscn")
	pass # Replace with function body.


func _on_Timer_timeout():
	area = true
	$postbox/Timer.stop()
	pass # Replace with function body.

func solider(s:int):
	inst = load("res://src/scene/Enemy/soldier1.tscn").instance()
	if s == 1:
		inst.position = Vector2(2223.419,-1652.564)
		inst._dialogbox = "chapter7_6_DB1"
		inst.text = "ทหาร"
		add_child(inst)
	elif s == 2:
		inst.position = Vector2(2223.419,-1652.564)
		inst._dialogbox = "chapter7_6_DB2"
		inst.text = "ทหาร"
		add_child(inst) 

func lable(value:String):
	$"/root/Global"._dialogbox = value
	if $dialogbox._dialogbox(true):
		$"/root/Global".player_pos = $player.position
		$dialogbox.show()
		$dialogbox.position.x = $player.position.x -660
		$dialogbox.position.y = $player.position.y + 120
		$dialogbox._dialogbox(true)

var solider1:bool = false
var solider2:bool = false
var DB1:bool = false
var DB2:bool = false
func finished():
	if $"/root/MissionInventory"._save_dialogbox.save[33] && not DB1:
		solider(1)
		DB1 = true
	if $"/root/MissionInventory"._save_dialogbox.save[34] && not solider1:
		inst.queue_free()
		$put_Enemy_Chapter7_6.putenemy()
		solider1 = true
	if $put_Enemy_Chapter7_6._Enemy <= 0 && not solider2 && $"/root/MissionInventory"._save_dialogbox.save[34]:
		solider(2)
		solider2 = true
	if $"/root/MissionInventory"._save_dialogbox.save[35] && not DB2:
		$wall/blocked.queue_free()
		DB2 = true
