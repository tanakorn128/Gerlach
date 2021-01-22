extends Node2D


func _ready():
	player_speed(0)
	Events.connect("player_position",self,"player_position")
	var inst = load("res://src/scene/dialogbox.tscn").instance()
	add_child(inst)
	inst.set_text(get_text())
	inst.connect("end_dialog",self,"end_dialog")
	position.x = 285
	position.y = 300
	pass
func end_dialog():
	queue_free()
	player_speed(10000)

func set_text():
	var text = {
		"0":{
			"1":"ยินดีต้อนรับสู่โลกของคณิตศาสตร์ ในโลกแห่งนี้ทุกอย่างล้วนแต่ตัดสินกันด้วยคณิตศาสตร์"
		},
		"1":{
			"1":"การต่อสู้ก็เช่นกัน ผู้ที่สามารถทำโจทย์ได้มากกว่าก็จะเป็นผู้ชนะไป"
		},
		"2":{
			"1":"เอาหล่ะสำหรับการครบคุมนั้น เราจะใช้ปุ่ม WASD ในการเคลื่อนที่ของตัวละคร Space bar ใช้ในการตอบตกลงต่างๆ และใช้การคลิกเมาย์ซ้ายในการเลือกตอบคำถาม"
		},
		"3":{
			"1":"เป็นไงควบคุมไม่ยากเลยใช่ไหมหล่ะ ฮ่าๆ เอาหล่ะมาดูในส่วนของเนื้อเรื่องบ้าง"
		},
		"4":{
			"1":"เกอราชกับสงครามโลกคณิตศาสตร์นั้นมีเนื้อเรื่องทั้งหมด 16 chapter"
		},
		"5":{
			"1":"โดยในแต่ละ chapter จะมีภารกิจที่แตกต่างกันออกไป"
		},
		"6":{
			"1":"จะต้องทำการเคลียร์ภารกิจทั้งหมด เพื่อที่จะปลดล็อค chapter ถัดไป"
		},
		"7":{
			"1":"และการบันทึกเกมนั้น สามารถบันทึกเกมได้ที่ตู้จดหมายประจำแต่ละ chapter "
		},
		"8":{
			"1":"ฮิๆ ข้ารู้ว่าเจ้าพร้อมแล้ว"
		},
		"9":{
			"1":"มาจบสงครามโลกคณิตศาสตร์นี้ด้วยกันเถอะ"
		},
		"10":{
			"1":"chapter 1 ช่างตัดไม้ กับ ปีศาจ"
		},
		"11":{
			"1":"ภารกิจ : ตัดต้นไม้ขนาดใหญ่ 4 ต้นที่กระจัดกระจายอยู่ภายในป่า (TIP สามารอ่านป้ายในป่าเพื่อนำทางไปสู่ต้นไม้ได้)"
		}
	}
	return text

func get_text():
	return set_text()
	pass
func player_position(position):
	
	pass

func player_speed(speed):
	Events.emit_signal("player_speed",speed)
	pass
