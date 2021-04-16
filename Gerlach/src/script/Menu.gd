extends Control
#(ป6 เล่ม 1)
#บทที่1 จำนวนนับ และการบวก การลบ การคูณ การหาร จำนวนนับ
#บทท่ี่2 สมการและการแก้สมการ
#บทที่3 ตัวประกอบของจำนวนนับ
#บทที่4 มุมและส่วนต่างของเส้นตรง
#บทที่5 เส้นขนาน
#ยทที่6 ทิศและแผนผัง
#บทที่7 เศษส่วนและการบวกลบคูณหาร


func _ready():
	$"/root/Global".scene = 1
	Events.connect("count_dialogbox",self,"count_dialogbox")
func _on_start_button_down():
	$"/root/Global"._dialogbox = "prechapter1"
	if not $dialogbox._dialogbox(true):
		changescene()
	else:
		$black.show()
		$dialogbox.show()
		$Sprite.show()
		$Label.hide()
		$Label2.hide()
		$start.hide()
		$"EXIT GAME".hide()
		$dialogbox._dialogbox(true)
	pass # Replace with function body.


func _on_EXIT_GAME_button_down():
	get_tree().quit()
	pass # Replace with function body.

func changescene():
	$"/root/Scene".scene($"/root/MissionInventory"._save_player.chapter)
	



func count_dialogbox(count):
	if count == 1:
		$Sprite.texture = _image(1)
	if count == 2:
		$Sprite.texture = _image(0)
	if count == 10:
		$Sprite.texture = _image(2)
	if count == 14:
		$Sprite.texture = _image(5)
	if count == 15:
		$Sprite.texture = _image(6)###
	if count == 17:
		$Sprite.texture = _image(8)
	#if count == 18:
		#$Sprite.texture = _image(6)
	if count == 19:
		$Sprite.texture = _image(0)
func _image(num:int):
	var image:Array
	image.append(load("res://assets/Game_Start/world.png")) #0
	image.append(load("res://assets/Game_Start/2.png")) #1
	image.append(load("res://assets/Game_Start/11.png")) #2
	image.append(load("res://assets/Game_Start/12.png")) #3
	image.append(load("res://assets/Game_Start/13.png")) #4
	image.append(load("res://assets/Game_Start/15.png")) #5
	image.append(load("res://assets/Game_Start/16.png")) #6
	image.append(load("res://assets/Game_Start/17.png")) #7
	image.append(load("res://assets/Game_Start/18.png")) #8
	return image[num]

func _exam():
	var dic:Dictionary = {
		"question": " ",
		"answer": " ",
		"status": false
	} 
	$"/root/MissionInventory"._save_exam.chapter1.clear()
	$"/root/MissionInventory"._save_exam.chapter2.clear()
	$"/root/MissionInventory"._save_exam.chapter3.clear()
	$"/root/MissionInventory"._save_exam.chapter4.clear()
	$"/root/MissionInventory"._save_exam.chapter5.clear()
	$"/root/MissionInventory"._save_exam.chapter6.clear()
	$"/root/MissionInventory"._save_exam.chapter7.clear()
	$"/root/MissionInventory"._save_exam.chapter8.clear()
	$"/root/MissionInventory"._save_exam.chapter1.append(dic)
	$"/root/MissionInventory"._save_exam.chapter2.append(dic)
	$"/root/MissionInventory"._save_exam.chapter3.append(dic)
	$"/root/MissionInventory"._save_exam.chapter4.append(dic)
	$"/root/MissionInventory"._save_exam.chapter5.append(dic)
	$"/root/MissionInventory"._save_exam.chapter6.append(dic)
	$"/root/MissionInventory"._save_exam.chapter7.append(dic)
	$"/root/MissionInventory"._save_exam.chapter8.append(dic)
	ResourceSaver.save("user://exam/exam.tres",$"/root/MissionInventory"._save_exam)
