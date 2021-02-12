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
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	#print(save_nodes.size())
	$AudioStreamPlayer.playing = true
	pass

func _on_start_button_down():
	get_tree().change_scene("res://src/scene/chapter1.tscn")
	pass # Replace with function body.


func _on_EXIT_GAME_button_down():
	get_tree().quit()
	pass # Replace with function body.
