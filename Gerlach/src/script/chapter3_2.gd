extends Node2D
var finished:bool = false
var _dialogbox2:bool = false
var _Enemys
onready var chapter = $"/root/MissionInventory"

func _ready():
	$"/root/Global"._Exam = 2
	lable("chapter3_2_dialogbox1")
	_stop()
	$"/root/Global".scene = 3

func _process(delta):
	update()

func update():
	dialogbox2()

func lable(value:String):
	$"/root/Global"._dialogbox = value
	if $dialogbox._dialogbox(true):
		$"/root/Global".player_pos = $player.position
		$dialogbox.show()
		$dialogbox.position.x = $player.position.x -660
		$dialogbox.position.y = $player.position.y + 120
		$dialogbox._dialogbox(true)

func _on_postbox_body_entered(body):
	if body.get_name() == "player":
		pass
	pass # Replace with function body.


func _on_postbox1_body_entered(body):
	if body.get_name() == "player":
		get_tree().change_scene("res://src/scene/postbox.tscn")
	pass # Replace with function body.


func _on_chapter4_1_body_entered(body):
	if body.get_name() == "player":
		$"/root/Scene".scene(4.1)
	pass # Replace with function body.

func _stop():
	_Enemys = chapter.all_chapter[3].dic.size()
	for i in _Enemys:
		if chapter.chapters(4,i,"finish"):
			_Enemys -= 1
	if _Enemys <= 0:
		soldier()
		$stop.queue_free()
		
	
func soldier():
	var soldier = load("res://src/scene/Enemy/soldier1.tscn").instance()
	soldier.position = Vector2(3346.72,-1516.434)
	soldier._dialogbox = "chapter3_2_dialogbox3"
	add_child(soldier)

func dialogbox2():
	_Enemys = chapter.all_chapter[3].dic.size()
	for i in _Enemys:
		if chapter.chapters(4,i,"finish"):
			_Enemys -= 1
	if _Enemys <= 0 && not _dialogbox2:
		lable("chapter3_2_dialogbox2")
		_dialogbox2 = true
