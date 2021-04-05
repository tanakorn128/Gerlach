extends Node2D
const HUDPOSY = 350
const HUDPOSX = 600
var _Enemys
onready var chapter = $"/root/MissionInventory"

func _ready():
	$"/root/Global"._Exam = 2
	lable("chapter3_1_dialogbox1")
	_stop()
	$"/root/Global".scene = 3


func _on_postbox1_body_entered(body):
	if body.get_name() == "player":
		lable("chapter3_1 ป้ายบอกทาง 1")
	pass # Replace with function body.


func lable(value:String):
	$"/root/Global"._dialogbox = value
	if $dialogbox._dialogbox(true):
		$"/root/Global".player_pos = $player.position
		$dialogbox.show()
		$dialogbox.position.x = $player.position.x -660
		$dialogbox.position.y = $player.position.y + 120
		$dialogbox._dialogbox(true)

func _stop():
	_Enemys = chapter.all_chapter[3].dic.size()
	for i in _Enemys:
		if chapter.chapters(4,i,"finish"):
			_Enemys -= 1
	if _Enemys <= 0:
		$stop.queue_free()
	


func _on_chapter4_1_body_entered(body):
	if body.get_name() == "player":
		$"/root/Scene".scene(4.1)
	pass # Replace with function body.



func _on_chapter3_2_body_entered(body):
	if body.get_name() == "player":
		$"/root/Scene".scene(3)
	pass # Replace with function body.
