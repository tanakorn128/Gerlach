extends Node2D
const HUDPOSY = 350
const HUDPOSX = 600

var _Enemys
onready var chapter = $"/root/MissionInventory"

func _ready():
	_stop()
	$"/root/Global".scene = 3.2
func _process(delta):
	update()

func change():
	$HUD.position.x = $player.position.x - HUDPOSX
	$HUD.position.y = $player.position.y - HUDPOSY

func update():
	change()


func lable(value:String):
	$"/root/Global"._dialogbox = value
	if $dialogbox._dialogbox(true):
		$"/root/Global".player_pos = $player.position
		$dialogbox.show()
		$dialogbox.position = $player.position - get_viewport_rect().size/2
		$dialogbox.position.y = $player.position.y - get_viewport_rect().size.y/13
		$dialogbox._dialogbox(true)

func _on_postbox_body_entered(body):
	if body.get_name() == "player":
		lable("chapter3_2 ป้ายบอกทาง 1")
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
	_Enemys = chapter.all_chapter[2].dic.size()
	for i in _Enemys:
		if chapter.chapters(3,i,"finish"):
			_Enemys -= 1
	if _Enemys <= 0:
		$stop.queue_free()
	
	
