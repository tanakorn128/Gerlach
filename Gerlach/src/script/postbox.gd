extends Node2D
var count:int
onready var chapter1 = $"/root/MissionInventory"
var _Enemy:int
func _ready():
	$GridContainer/Label1.text = "กำจัดศัตรูที่ซ่อนอยู่"
	var audio = $AudioStreamPlayer2D.stream as AudioStreamOGGVorbis
	audio.set_loop(false)
	Events.connect("postbox",self,"postbox")
	_Enemy($"/root/Global".scene)


func _on_Button_button_down():
	$AudioStreamPlayer2D.play()
	ResourceSaver.save($"/root/MissionInventory".chapter1.get_path(),$"/root/MissionInventory".chapter1)
	$GridContainer/Label1.text = "บันทึกเกมสำเร็จ"
	pass # Replace with function body.


func _on_back_button_down():
	$AudioStreamPlayer2D.play()
	if $"/root/Global".scene == 1:
		queue_free()
		get_tree().change_scene("res://src/scene/chapter1.tscn")
	pass # Replace with function body.


func _on_score_button_down():
	$AudioStreamPlayer2D.play()
	get_tree().change_scene("res://src/scene/Overview.tscn")
	pass # Replace with function body.

func postbox():
	_Enemy($"/root/Global".scene)
	
func _Enemy(chapter:int):
	_Enemy  = 0
	$ItemList.clear()
	if chapter == 1:
		count = chapter1.chapter1.dic.size()
		for i in count:
			if not chapter1.chapters(1,i,"finish"):
				_Enemy += 1
				
		$ItemList.add_item(str("- ศัตรูที่เหลือ ",_Enemy,"ตัว"),null,true)

