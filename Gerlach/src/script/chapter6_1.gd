extends Node2D
var _Enemys
onready var chapter = $"/root/MissionInventory"
var _dialogbox:bool = false
var chapter6_2:bool = false
func _ready():
	$"/root/Global"._Exam = 3
	lable("chapter6_1_dialogbox1")
	$"/root/Global".scene = 9
	$"/root/Global".number_enemy = 9
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
		soldier()
		_dialogbox = true
	
func soldier():
	var inst = load("res://src/scene/Enemy/soldier1.tscn").instance()
	inst.position = Vector2(3478.577,-1461.156)
	inst._dialogbox = "chapter6_1_dialogbox3"
	add_child(inst)
	chapter6_2 = true
	pass


func _on_Chapter6_2__body_entered(body):
	if body.get_name() == "player" && chapter6_2:
		$"/root/Scene".scene(10)
		
	pass # Replace with function body.


func _on_postbox_body_entered(body):
	if body.get_name() == "player":
		Events.emit_signal("postbox")
		get_tree().change_scene("res://src/scene/postbox.tscn")
	pass # Replace with function body.
