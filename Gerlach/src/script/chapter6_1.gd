extends Node2D
var _Enemys
onready var chapter = $"/root/MissionInventory"
var _dialogbox:bool = false

func _ready():
	lable("chapter6_1_dialogbox1")
	$"/root/Global".scene = 9
func _process(delta):
	 update()
	

func update():
	enemy()
	
func lable(value:String):
	$"/root/Global"._dialogbox = value
	if $dialogbox._dialogbox(true):
		$"/root/Global".player_pos = $player.position
		$dialogbox.show()
		$dialogbox.position = $player.position - get_viewport_rect().size/2
		$dialogbox.position.y = $player.position.y - get_viewport_rect().size.y/13
		$dialogbox._dialogbox(true)

func enemy():
	_Enemys = chapter.all_chapter[9].dic.size()
	for i in _Enemys:
		if chapter.chapters(10,i,"finish"):
			_Enemys -= 1
	if _Enemys <= 0 && not _dialogbox:
		lable("chapter6_1_dialogbox2")
		_dialogbox = true
	
