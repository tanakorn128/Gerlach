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
func _on_start_button_down():
	
	$"/root/Global"._dialogbox = "prechapter1"
	if not $dialogbox._dialogbox(true):
		changescene()
	else:
		$black.show()
		$dialogbox.show()
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

