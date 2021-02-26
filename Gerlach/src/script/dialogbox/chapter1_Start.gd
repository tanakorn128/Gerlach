extends Node2D

func _ready():
	if $"/root/Global".chapter1_Start:
		text()
		$dialogbox.get_text(0)
	else:
		queue_free()
	pass


func text():
	$dialogbox.set_text("ยินดีต้อนรับสู่โลกของคณิตศาสตร์ ในโลกแห่งนี้ทุกอย่างล้วนแต่ตัดสินกันด้วยคณิตศาสตร์")
	$dialogbox.set_text("การต่อสู้ก็เช่นกัน ผู้ที่สามารถทำโจทย์ได้มากกว่าก็จะเป็นผู้ชนะไป์")
	$dialogbox.set_text("เกอราชกับสงครามโลกคณิตศาสตร์นั้นมีเนื้อเรื่องทั้งหมด 16 chapter")
	$dialogbox.set_text("เกอราชกับสงครามโลกคณิตศาสตร์นั้นมีเนื้อเรื่องทั้งหมด 16 chapter")
	$dialogbox.set_text("โดยในแต่ละ chapter จะมีภารกิจที่แตกต่างกันออกไป")
	$dialogbox.set_text("จะต้องทำการเคลียร์ภารกิจทั้งหมด เพื่อที่จะปลดล็อค chapter ถัดไป")
	$dialogbox.set_text("มาจบสงครามโลกคณิตศาสตร์นี้ด้วยกันเถอะ")
	$dialogbox.set_text("chapter 1 ช่างตัดไม้ กับ ปีศาจ")
	$dialogbox.set_text("ภารกิจ : ตัดต้นไม้ขนาดใหญ่ 4 ต้นที่กระจัดกระจายอยู่ภายในป่า (TIP สามารอ่านป้ายในป่าเพื่อนำทางไปสู่ต้นไม้ได้)")
	$"/root/Global".chapter1_Start = false
	$dialogbox.audio = true
