extends Node2D
var _Enemys
onready var chapter = $"/root/MissionInventory"

func _ready():
	lable("chapter3_2_start")
	_stop()
	$"/root/Global".scene = 3

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
		pass
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
	_Enemys = chapter.all_chapter[3].dic.size()
	for i in _Enemys:
		if chapter.chapters(4,i,"finish"):
			_Enemys -= 1
	if _Enemys <= 0:
		soldier()
		$stop.queue_free()
		
	
func soldier():
	var soldier = load("res://src/scene/Enemy/soldier1.tscn").instance()
	soldier.position = Vector2(3346.72,-1516.434)
	soldier._dialogbox = "chapter3_2_end"
	add_child(soldier)
