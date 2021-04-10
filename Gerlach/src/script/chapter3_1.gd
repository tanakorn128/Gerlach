extends Node2D
const HUDPOSY = 350
const HUDPOSX = 600
var _Enemys
onready var chapter = $"/root/MissionInventory"
var area:bool = false
func _ready():
	#$player.position = $"/root/Global".player_pos
	$"/root/Global"._Exam = 2
	lable("chapter3_1_dialogbox1")
	_stop()
	$"/root/Global".scene = 4
	$Timer.start()
func _process(delta):
	#$"/root/Global".player_pos.x = $player.position.x
	#$"/root/Global".player_pos.y = $player.position.y
	pass
func _on_postbox1_body_entered(body):
	if body.get_name() == "player" && area:
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
	if body.get_name() == "player" && area:
		$"/root/Scene".scene(4.1)
	pass # Replace with function body.



func _on_chapter3_2_body_entered(body):
	if body.get_name() == "player" && area:
		$"/root/Scene".scene(4)
	pass # Replace with function body.


func _on_Timer_timeout():
	area = true
	$Timer.stop()
	pass # Replace with function body.
