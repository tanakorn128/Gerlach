extends Node2D
onready var chapter = $"/root/MissionInventory"
var _Enemys
var _dialogbox2:bool = false

func _ready():
	$"/root/Global"._Exam = 3
	lable("chapter15_2_dialogbox1")

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

func dialogbox2():
	_Enemys = chapter.all_chapter[21].dic.size()
	for i in _Enemys:
		if chapter.chapters(22,i,"finish"):
			_Enemys -= 1
	if _Enemys <= 0 && not _dialogbox2:
		lable("chapter15_2_dialogbox2")
		_dialogbox2 = true
