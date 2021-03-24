extends Node2D
export (Script) var game_save 
onready var chapter = $"/root/MissionInventory"
var finished = false

var _Enemys
func _ready():
	$"/root/Global".scene = 1
	$"/root/Global"._dialogbox = "startchapter1"
	_dialogbox()
	
func _process(delta):
	update()

func change():
	$HUD.position = $player.position - get_viewport_rect().size/2.1
	#$dialogbox.position = $player.position -get_viewport_rect().size/2
func update():
	change()

func _on_mailbox1_body_entered(body):	if body.get_name() == "player":
		Events.emit_signal("postbox")
		get_tree().change_scene("res://src/scene/postbox.tscn")
		
		

func _dialogbox():

	if not $dialogbox._dialogbox():
		pass
	else:
		$dialogbox.show()
		$dialogbox.position = $player.position - get_viewport_rect().size/2
		$dialogbox._dialogbox()



func _on_next_chapter_body_entered(body):
	_Enemys = chapter.all_chapter[0].dic.size()
	for i in _Enemys:
		if chapter.chapters(1,i,"finish"):
			_Enemys -= 1
	if _Enemys <= 0:
		finished = true
	
	if body.get_name() == "player":
		if finished:
			get_tree().change_scene("res://src/scene/chapter2.tscn")
		else:
			get_tree().change_scene("res://src/scene/chapter1.tscn")
	pass # Replace with function body.
