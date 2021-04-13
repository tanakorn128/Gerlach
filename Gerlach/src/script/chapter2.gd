extends Node2D
var finished:bool = false
var _Enemys
onready var chapter = $"/root/MissionInventory"
var area:bool = false
export (bool) var test
func _ready():
	$"/root/MissionInventory"._save_player.chapter = 2
	
	if test && not $"/root/Global".test:
		$"/root/Global".player_pos = Vector2(635.898,84)
		$"/root/Global".test = true
	else:
		$player.position = $"/root/MissionInventory"._save_player.position
	$"/root/Global"._Exam = 2
	$"/root/Global".scene = 2
	lable("chapter2_dialogbox1")
	$postbox/Timer.start()
	finished()
func _process(delta):
	$"/root/MissionInventory"._save_player.position = $player.position
	update()



func update():
	pass

func _on_postbox_body_entered(body):
	$"/root/Global".scene = 2
	if body.get_name() == "player" && area:
		Events.emit_signal("postbox")
		get_tree().change_scene("res://src/scene/postbox.tscn")
	pass # Replace with function body.

func finished():
	var Enemy_index:int = 2
	var _Enemy:int
	var count = chapter.all_chapter[Enemy_index].dic.size()
	var id 
	for i in count:
		id = chapter.chapters(Enemy_index+1,i,"id")
		if not $"/root/MissionInventory"._save_mission.save[id]:
			_Enemy += 1
	if _Enemy <= 0:
		lable("chapter2_dialogbox2")
		var Headman = load("res://src/scene/Enemy/Headman.tscn").instance()
		Headman._dialogbox = "chapter2_dialogbox3"
		Headman.position = Vector2(2956.713,-19.957)
		Headman.text = "หัวหน้าหมู่บ้าน"
		add_child(Headman)
		$wall/blocked.queue_free()
		$"/root/Global".chapter2_dialogbox2 = true
	print(_Enemy)


func _on_chapter3_1_body_entered(body):
	if body.get_name() == "player": #&& area:
		if true: #finished:
			$"/root/Global".player_pos = Vector2(395.992,26.163)
			$"/root/Scene".scene(3)
		else:
			$"/root/Global".player_pos = Vector2(635.898,84.035)
			get_tree().change_scene("res://src/scene/chapter2.tscn")
	pass # Replace with function body.
	

func lable(value:String):
	$"/root/Global"._dialogbox = value
	if $dialogbox._dialogbox(true):
		$"/root/Global".player_pos = $player.position
		$dialogbox.show()
		$dialogbox.position.x = $player.position.x -660
		$dialogbox.position.y = $player.position.y + 120
		$dialogbox._dialogbox(true)

func _on_Timer_timeout():
	area = true
	$postbox/Timer.stop()
	pass # Replace with function body.
