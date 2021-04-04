extends Node2D
onready var chapter = $"/root/MissionInventory"
var _Enemys
var _dialogbox:bool = false

func _ready():
	$"/root/Global"._Exam = 3
	pass

func _process(delta):
	enemy()

func lable(value:String):
	$"/root/Global"._dialogbox = value
	if $dialogbox._dialogbox(true):
		$"/root/Global".player_pos = $player.position
		$dialogbox.show()
		$dialogbox.position.x = $player.position.x -660
		$dialogbox.position.y = $player.position.y + 120
		$dialogbox._dialogbox(true)

func enemy():
	_Enemys = chapter.all_chapter[8].dic.size()
	for i in _Enemys:
		if chapter.chapters(9,i,"finish"):
			_Enemys -= 1
	if _Enemys <= 0 &&  not _dialogbox:
		lable("chapter5_3_dialogbox2")
		$wall/stop.queue_free()
		_dialogbox = true

func _on_npc_body_entered(body):
	if body.get_name() == "player":
		#lable("chapter5_3 npc 1")
		pass
	pass # Replace with function body.


func _on_chapter5_2_body_entered(body):
	if body.get_name() == "player":
		$"/root/Scene".scene(5)
	pass # Replace with function body.
