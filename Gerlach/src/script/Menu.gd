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
	var size = $"/root/MissionInventory".all_chapter.size()
	var chapter = 1
	for i in size:
		if chapterX(chapter):
			chapter += 1
		else:
			$"/root/Scene".scene(chapter)


func chapterX(chapter:int):
	var size = $"/root/MissionInventory".all_chapter.size()
	var _mission = $"/root/MissionInventory".all_chapter[chapter-1].dic.size()
	var temp:int = _mission
	for i in _mission:
		if $"/root/MissionInventory".chapters(chapter,i,"finish"): #ภารกิจจบแล้ว
			temp -= 1
	if temp == 0:
		return true #chapterนั้นจบแล้ว
	else:
		return false

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

