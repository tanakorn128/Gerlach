extends Node2D
const HUDPOSY = 350
const HUDPOSX = 600
var finished = false
var _Enemys
onready var chapter = $"/root/MissionInventory"

func _ready():
	$"/root/Global".scene = 2
	
func _process(delta):
	update()

func change():
	$HUD.position.x = $player.position.x - HUDPOSX
	$HUD.position.y = $player.position.y - HUDPOSY

func update():
	change()


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
