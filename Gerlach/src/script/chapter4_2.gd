extends Node2D
onready var chapter = $"/root/MissionInventory"
var _Enemys
var _Enemys5_3
var state_Enemys5_3:bool = false
var state_Enemys6_2:bool = false
var _dialogbox:bool = false
var soldier1:bool 
var soldier2:bool
var soldier3:bool

func _ready():
	$"/root/Global".scene = 5
	$"/root/Global"._Exam = 2
	$"/root/Global".number_enemy = 0
	lable("chapter4_2_dialogbox1")
	#lable("chapter4_2_start")
	
func _process(delta):
	update()

func update():
	enemy()
	chapter5_3_finished()
	chapter6_2_finished()
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
		$dialogbox.position.x = $player.position.x -660
		$dialogbox.position.y = $player.position.y + 120
		$dialogbox._dialogbox(true)


func enemy():
	_Enemys = chapter.all_chapter[5].dic.size()
	for i in _Enemys:
		if chapter.chapters(6,i,"finish"):
			_Enemys -= 1
	if _Enemys <= 0 && not _dialogbox:
		lable("chapter4_2_dialogbox3")
		_dialogbox = true

func chapter5_3_finished():
	_Enemys5_3 = chapter.all_chapter[8].dic.size()
	for i in _Enemys5_3:
		if chapter.chapters(9,i,"finish"):
			_Enemys5_3 -= 1
	if _Enemys5_3 <= 0 && not state_Enemys5_3:
		var inst = load("res://src/scene/Enemy/soldier1.tscn").instance()
		inst.position = Vector2(1300.614,-2398.856)
		inst._dialogbox = "chapter4_2_dialogbox2"
		add_child(inst)
		state_Enemys5_3 = true

func chapter6_2_finished():
	if not $"/root/Global".chapter6_2 && not state_Enemys6_2:
		var inst = load("res://src/scene/Enemy/soldier1.tscn").instance()
		inst.position = Vector2(3218.191,-2278.2186)
		inst._dialogbox = "chapter6_2_dialogbox2"
		add_child(inst)
		state_Enemys6_2 = true
	


func _on_postbox_body_entered(body):
	if body.get_name() == "player":
		Events.emit_signal("postbox")
		get_tree().change_scene("res://src/scene/postbox.tscn")
	pass # Replace with function body.
