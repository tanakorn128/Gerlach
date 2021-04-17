extends Node2D
var finished:bool = false
var _dialogbox2:bool = false
var _Enemys
var area:bool = false
onready var chapter = $"/root/MissionInventory"
export (bool) var test

func _ready():
	$"/root/MissionInventory"._save_player.chapter = 4
	if test && not $"/root/Global".test:
		$"/root/Global".player_pos = Vector2(977.103,-274.977)
		$"/root/Global".test = true
	else:
		$player.position = $"/root/MissionInventory"._save_player.position
	$"/root/Global"._Exam = 3
	$"/root/Global".scene = 4
	$"/root/Global".chapter = "chapter3"
	lable("chapter3_2_dialogbox1")
	$postbox1/Timer.start()
	_mission()
	finished()
	
func _process(delta):
	$"/root/MissionInventory"._save_player.position = $player.position

func lable(value:String):
	$"/root/Global"._dialogbox = value
	if $dialogbox._dialogbox(true):
		$"/root/Global".player_pos = $player.position
		$dialogbox.show()
		$dialogbox.position.x = $player.position.x -660
		$dialogbox.position.y = $player.position.y + 120
		$dialogbox._dialogbox(true)
	if value == "chapter3_2_dialogbox2":
		$wall/blocked.queue_free()
	return $dialogbox._dialogbox(true)

func _on_chapter4_1_body_entered(body):
	if body.get_name() == "player":
		$"/root/Scene".scene(5)
	pass # Replace with function body.

func finished():
	var Enemy_index:int = 3
	var _Enemy:int
	var count = chapter.all_chapter[Enemy_index].dic.size()
	var id 
	for i in count:
		id = chapter.chapters(Enemy_index+1,i,"id")
		if not $"/root/MissionInventory"._save_mission.save[id]:
			_Enemy += 1
	if _Enemy <= 0:
		lable("chapter3_2_dialogbox2")
		soldier()
		
		
func soldier():
	var soldier = load("res://src/scene/Enemy/soldier1.tscn").instance()
	soldier.position = Vector2(3346.72,-1516.434)
	soldier._dialogbox = "chapter3_2_dialogbox3"
	add_child(soldier)


func _on_postbox1_body_entered(body):
	if body.get_name() == "player" && area:
		$"/root/Global".scene = 4
		get_tree().change_scene("res://src/scene/postbox.tscn")
	pass # Replace with function body.


func _on_Timer_timeout():
	area = true
	$postbox1/Timer.stop()
	pass # Replace with function body.

func _mission():
	var arr = $"/root/Global"._mission
	arr.clear()
	arr.append("ภารกิจ : กำจัดปีศาจทั้งหมดภายในป้อมปราการ")
	arr.append(" 5 ตัว")
