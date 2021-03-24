extends Node2D
var count:int
onready var chapter = $"/root/MissionInventory"
var Enemy_index:int = 0

func _ready():
	$GridContainer/Label1.text = "กำจัดศัตรูที่ซ่อนอยู่"
	var audio = $AudioStreamPlayer2D.stream as AudioStreamOGGVorbis
	audio.set_loop(false)
	Events.connect("postbox",self,"postbox")
	_Enemy($"/root/Global".scene)


func _on_Button_button_down():
	$AudioStreamPlayer2D.play()
	var scene = $"/root/Global".scene
	ResourceSaver.save(chapter.all_chapter[scene-1].get_path(),chapter.all_chapter[scene-1])
	$GridContainer/Label1.text = "บันทึกเกมสำเร็จ"
	pass # Replace with function body.


func _on_back_button_down():
	$AudioStreamPlayer2D.play()
	queue_free()
	$"/root/Scene".scene($"/root/Global".scene)
	pass # Replace with function body.


func _on_score_button_down():
	$AudioStreamPlayer2D.play()
	get_tree().change_scene("res://src/scene/Overview.tscn")
	pass # Replace with function body.

func postbox():
	_Enemy($"/root/Global".scene)
	
func _Enemy(scene:int):
	$ItemList.clear()
	count = chapter.all_chapter[scene-1].dic.size()
	for i in count:
		if not chapter.chapters(scene,i,"finish"):
			Enemy_index += 1
	$ItemList.add_item(str("- ศัตรูที่เหลือ ",Enemy_index,"ตัว"),null,true)

