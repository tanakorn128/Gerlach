extends Node2D
const HUDPOSY = 350
const HUDPOSX = 600
onready var chapter = $"/root/MissionInventory"
var _Enemys
var _dialogbox:bool = true
func _ready():
	$"/root/Global".number_enemy = 5
	lable("chapter4_2_start")
	
func _process(delta):
	update()

func change():
	$HUD.position.x = $player.position.x - HUDPOSX
	$HUD.position.y = $player.position.y - HUDPOSY

func update():
	change()
	enemy()


func _on_chapter6_body_entered(body):
	if body.get_name() == "player":
		$"/root/Scene".scene(6)
	pass # Replace with function body.


func _on_chapter5_2_body_entered(body):
	if body.get_name() == "player":
		$"/root/Scene".scene(5.2)
	pass # Replace with function body.

func lable(value:String):
	$"/root/Global"._dialogbox = value
	if $dialogbox._dialogbox(true):
		$"/root/Global".player_pos = $player.position
		$dialogbox.show()
		$dialogbox.position = $player.position - get_viewport_rect().size/2
		$dialogbox.position.y = $player.position.y - get_viewport_rect().size.y/13
		$dialogbox._dialogbox(true)


func enemy():
	_Enemys = chapter.all_chapter[5].dic.size()
	for i in _Enemys:
		if chapter.chapters(6,i,"finish"):
			_Enemys -= 1
	if _Enemys <= 0:
		_dialogbox = false
	if _Enemys <= 0 && not _dialogbox:
		lable("chapter4_2_end")
		_dialogbox = true
