extends Node2D
export (Script) var game_save 
onready var chapter = $"/root/MissionInventory"
var finished = false
var _Enemys
var monster
var finished_monster:bool = false
func _ready():
	Events.connect("Enemy_pos",self,"monster1")
	$player.position = $"/root/Global".player_pos
	$"/root/Global".scene = 1
	$"/root/Global"._dialogbox = "startchapter1"
	_dialogbox()

func _process(delta):
	momster()

func _on_mailbox1_body_entered(body):	if body.get_name() == "player":
		Events.emit_signal("postbox")
		get_tree().change_scene("res://src/scene/postbox.tscn")
		
		

func _dialogbox():
	if not $dialogbox._dialogbox(true): #ยจบไปแล้ว
		pass
	else: #ยังไม่จบ
		$dialogbox.show()
		$dialogbox.position.x = $player.position.x -660
		$dialogbox.position.y = $player.position.y + 120
		$dialogbox._dialogbox(true) #ต้องการ save ไหม

func monster1(pos):
	$"/root/Global".Enemy_pos = pos
	

func momster():
	monster = chapter.all_chapter[22].dic.size()
	for i in monster:
		if chapter.chapters(23,i,"finish"):
			monster -= 1
	if monster <= 0 && not finished_monster:
		lable("chapter1_dialogbox3")
		finished_monster = true
	
	
func _on_next_chapter_body_entered(body):
	_Enemys = chapter.all_chapter[0].dic.size()
	for i in _Enemys:
		if chapter.chapters(1,i,"finish"):
			_Enemys -= 1
	if _Enemys <= 0:
		lable("chapter1_dialogbox2")
		$put_Enemy_Chapter1.monster()
		finished = true
		
	
	if body.get_name() == "player" && finished_monster:
		if finished:
			get_tree().change_scene("res://src/scene/chapter2.tscn")
		else:
			get_tree().change_scene("res://src/scene/chapter1.tscn")
	pass # Replace with function body.

func lable(value:String):
	$"/root/Global"._dialogbox = value
	if $dialogbox._dialogbox(true):
		$"/root/Global".player_pos = $player.position
		$dialogbox.show()
		$dialogbox.position.x = $player.position.x -660
		$dialogbox.position.y = $player.position.y + 120
		$dialogbox._dialogbox(true)


func _on_lable_body_entered(body):
	if body.get_name() == "player":
		lable("ป้ายบอกทาง 1")
	pass # Replace with function body.


func _on_lable2_body_entered(body):
	if body.get_name() == "player":
		lable("ป้ายบอกทาง 2")
	pass # Replace with function body.

func _on_lable3_body_entered(body):
	if body.get_name() == "player":
		lable("ป้ายบอกทาง 3")
	pass # Replace with function body.


func _on_lable4_body_entered(body):
	if body.get_name() == "player":
		lable("ป้ายบอกทาง 4")
	pass # Replace with function body.


func _on_lable5_body_entered(body):
	if body.get_name() == "player":
		lable("ป้ายบอกทาง 5")
	pass # Replace with function body.



func _on_lable6_body_entered(body):
	if body.get_name() == "player":
		lable("ป้ายบอกทาง 6")
	pass # Replace with function body.


func _on_lable7_body_entered(body):
	if body.get_name() == "player":
		lable("ป้ายบอกทาง 7")
	pass # Replace with function body.


func _on_lable8_body_entered(body):
	if body.get_name() == "player":
		lable("ป้ายบอกทาง 8")
	pass # Replace with function body.
