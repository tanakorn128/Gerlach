extends Node2D
var area:bool = false
export (bool) var test
onready var chapter = $"/root/MissionInventory"
func _ready():
	if test && not $"/root/Global".test:
		$"/root/Global".player_pos = Vector2(1003.25,1125.7)
		$"/root/Global".test = true
	else:
		$player.position = $"/root/MissionInventory"._save_player.position
	$"/root/Global"._Exam = 2
	$"/root/MissionInventory"._save_player.chapter = 7
	$postbox/Timer.start()
	lable("chapter5_1_DB1")
	finished()

func _process(delta):
	$"/root/MissionInventory"._save_player.position = $player.position

func _on_Chapter5_2__body_entered(body):
	if body.get_name() == "player":
		$"/root/Scene".scene(8)
	pass # Replace with function body.


func _on_postbox_body_entered(body):
	$"/root/Global".scene = 7
	if body.get_name() == "player" && area:
		Events.emit_signal("postbox")
		get_tree().change_scene("res://src/scene/postbox.tscn")
	pass # Replace with function body.


func _on_Timer_timeout():
	area = true
	$postbox/Timer.stop()
	pass # Replace with function body.
	

func solider():
	var inst = load("res://src/scene/Enemy/soldier1.tscn").instance()
	inst.position = Vector2(3447.361,-1477.551)
	inst._dialogbox = "chapter5_1_DB3"
	inst.text = "ทหาร"
	add_child(inst)

func finished():
	var _Enemy = $put_Enemy_Chapter5_1._Enemy
	if _Enemy <= 0:
		lable("chapter5_1_DB2")
	if $"/root/MissionInventory"._save_dialogbox.save[25] && not $"/root/MissionInventory"._save_dialogbox.save[26]:
		solider()
	if $"/root/MissionInventory"._save_dialogbox.save[26]:
		$wall/blocked.queue_free()
	
func lable(value:String):
	$"/root/Global"._dialogbox = value
	if $dialogbox._dialogbox(true):
		$"/root/Global".player_pos = $player.position
		$dialogbox.show()
		$dialogbox.position.x = $player.position.x -660
		$dialogbox.position.y = $player.position.y + 120
		$dialogbox._dialogbox(true)
