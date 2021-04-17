extends Node2D
var count:int
onready var chapter = $"/root/MissionInventory"
var Enemy_index:int = 0 #in array
var id

func _ready():
	$GridContainer/Label1.text = "กำจัดศัตรูที่ซ่อนอยู่"
	var audio = $click.stream as AudioStreamOGGVorbis
	audio.set_loop(false)
	Events.connect("postbox",self,"postbox")
	_Enemy($"/root/Global".number_enemy)
	


func _on_back_button_down():
	$click.play()
	$"/root/Scene".scene($"/root/Global".scene)
	queue_free()
	pass # Replace with function body.


func _on_score_button_down():
	$click.play()
	get_tree().change_scene("res://src/scene/Overview.tscn")
	pass # Replace with function body.

func postbox():
	_Enemy(1) #$"/root/Global".number_enemy
	
func _Enemy(enemy:int):
	$ItemList.clear()
	count = chapter.all_chapter[enemy].dic.size()
	for i in count:
		id = chapter.chapters(enemy+1,i,"id")
		if not $"/root/MissionInventory"._save_mission.save[id]:
			Enemy_index += 1
	$ItemList.add_item(str("- ศัตรูที่เหลือ ",Enemy_index),null,true)
	_mission()


func _on_save_button_down():
	$click.play()
	var scene = $"/root/Global".scene
	$"/root/Player".player.position = $"/root/Global".player_pos
	#ResourceSaver.save(chapter.all_chapter[scene-1].get_path(),chapter.all_chapter[scene-1])
	#ResourceSaver.save("res://assets/player/player.tres",$"/root/Player".player)
	var Error_dialogbox:int = ResourceSaver.save("user://dialogbox/dialogbox.tres",$"/root/MissionInventory"._save_dialogbox)
	var Error_mission:int = ResourceSaver.save("user://mission/mission.tres",$"/root/MissionInventory"._save_mission)
	ResourceSaver.save("user://player/player.tres",$"/root/MissionInventory"._save_player)
	ResourceSaver.save("user://exam/exam.tres",$"/root/MissionInventory"._save_exam)
	
	if Error_dialogbox == 0 && Error_mission == 0:
		$GridContainer/Label1.text = "บันทึกเกมสำเร็จ"
	else:
		$GridContainer/Label1.text = str("Error",Error_dialogbox," Error",Error_mission)
	pass # Replace with function body.

func _mission():
	var arr = $"/root/Global"._mission
	var count = arr.size()
	for i in count:
		$ItemList.add_item(arr[i],null,true)


func _on_profile_button_down():
	get_tree().change_scene("res://src/scene/profile.tscn")
	pass # Replace with function body.
