extends Node2D
var finished:bool = false
var _dialogbox2:bool = false
var _Enemys
onready var chapter = $"/root/MissionInventory"

func _ready():
	$player.position = $"/root/Global".player_pos
	$"/root/Global"._Exam = 2
	$"/root/Global".scene = 2
	lable("chapter2_dialogbox1")
func _process(delta):
	$"/root/Global".player_pos.x = $player.position.x
	$"/root/Global".player_pos.y = $player.position.y + 10
	update()



func update():
	dialogbox2()

func _on_postbox_body_entered(body):
	$"/root/Global".scene = 2
	if body.get_name() == "player":
		Events.emit_signal("postbox")
		get_tree().change_scene("res://src/scene/postbox.tscn")
	pass # Replace with function body.


func _on_chapter3_1_body_entered(body):
	_Enemys = chapter.all_chapter[1].dic.size()
	for i in _Enemys:
		if chapter.chapters(2,i,"finish"):
			_Enemys -= 1
	if _Enemys <= 0:
		finished = true
	
	if body.get_name() == "player":
		if finished:
			get_tree().change_scene("res://src/scene/chapter3_1.tscn")
		else:
			get_tree().change_scene("res://src/scene/chapter2.tscn")
	pass # Replace with function body.
	
func dialogbox2():
	_Enemys = chapter.all_chapter[1].dic.size()
	for i in _Enemys:
		if chapter.chapters(2,i,"finish"):
			_Enemys -= 1
	if _Enemys <= 0 && not _dialogbox2:
		lable("chapter2_dialogbox2")
		var Headman = load("res://src/scene/Enemy/Headman.tscn").instance()
		Headman._dialogbox = "chapter2_dialogbox3"
		Headman.position = Vector2(2956.713,-19.957)
		add_child(Headman)
		_dialogbox2 = true
	

func lable(value:String):
	$"/root/Global"._dialogbox = value
	if $dialogbox._dialogbox(true):
		$"/root/Global".player_pos = $player.position
		$dialogbox.show()
		$dialogbox.position.x = $player.position.x -660
		$dialogbox.position.y = $player.position.y + 120
		$dialogbox._dialogbox(true)
