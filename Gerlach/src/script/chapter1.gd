extends Node2D
export (Script) var game_save 
onready var chapter = $"/root/MissionInventory"
var finished = false
var _Enemys
var monster
var finished_monster:bool = false
var area:bool = false

func _ready():
	$"/root/Global"._Exam = 1
	Events.connect("Enemy_pos",self,"monster1")
	$player.position = $"/root/Global".player_pos
	$"/root/Global".scene = 1
	$"/root/Global"._dialogbox = "startchapter1"
	_dialogbox()
	$postbox2/Timer.start()
	momster()
func _process(delta):
	$"/root/Global".player_pos.x = $player.position.x
	$"/root/Global".player_pos.y = $player.position.y

func _on_mailbox1_body_entered(body):
	if body.get_name() == "player" && area:
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
	var count = chapter.all_chapter[0].dic.size()
	var Enemychapter1:int
	var id 
	
	monster = chapter.all_chapter[1].dic.size()
	for i in monster:
		id = chapter.chapters(2,i,"id")
		if  $"/root/MissionInventory"._save_mission.save[id]:
			lable2("chapter1_dialogbox3")
			$wall/blocked.queue_free()
			finished_monster = true
	
	for i in count:
		id = chapter.chapters(1,i,"id")
		if not $"/root/MissionInventory"._save_mission.save[id]:
			Enemychapter1 += 1
	if Enemychapter1 <= 0 && not finished_monster:
		lable2("chapter1_dialogbox2")
		$put_Enemy_Chapter1.monster()


func _on_next_chapter_body_entered(body):
	if body.get_name() == "player":
		if true: #finished && finished_monster:
			$"/root/Global".player_pos = Vector2(635.898,84.035)
			get_tree().change_scene("res://src/scene/chapter2.tscn")
		else:
			$"/root/Global".player_pos = Vector2(889.7,898.25)
			$"/root/Scene".scene(1)
	pass # Replace with function body.

func lable(value:String):
	$"/root/Global"._dialogbox = value
	if $dialogbox._dialogbox(false):
		$dialogbox.show()
		$dialogbox.position.x = $player.position.x -660
		$dialogbox.position.y = $player.position.y + 120
		$dialogbox._dialogbox(false)

func lable2(value:String):
	$"/root/Global"._dialogbox = value
	if $dialogbox._dialogbox(true):
		$dialogbox.show()
		$dialogbox.position.x = $player.position.x -660
		$dialogbox.position.y = $player.position.y + 120
		$dialogbox._dialogbox(true)

func _on_lable_body_entered(body):
	if body.get_name() == "player" && area:
		lable("ป้ายบอกทาง 1")
	pass # Replace with function body.


func _on_lable2_body_entered(body):
	if body.get_name() == "player" && area:
		lable("ป้ายบอกทาง 2")
	pass # Replace with function body.

func _on_lable3_body_entered(body):
	if body.get_name() == "player" && area:
		lable("ป้ายบอกทาง 3")
	pass # Replace with function body.


func _on_lable4_body_entered(body):
	if body.get_name() == "player" && area:
		lable("ป้ายบอกทาง 4")
	pass # Replace with function body.


func _on_lable5_body_entered(body):
	if body.get_name() == "player" && area:
		lable("ป้ายบอกทาง 5")
	pass # Replace with function body.



func _on_lable6_body_entered(body):
	if body.get_name() == "player" && area:
		lable("ป้ายบอกทาง 6")
	pass # Replace with function body.


func _on_lable7_body_entered(body):
	if body.get_name() == "player" && area:
		lable("ป้ายบอกทาง 7")
	pass # Replace with function body.


func _on_lable8_body_entered(body):
	if body.get_name() == "player" && area:
		lable("ป้ายบอกทาง 8")
	pass # Replace with function body.


func _on_Timer_timeout():
	area = true
	$postbox2/Timer.stop()
	pass # Replace with function body.

var clear1 = false
func _on_checkmission_body_entered(body):
	
	pass # Replace with function body.
