extends Node2D
var chapter
var chapter1_color
var color_Wrong
var score_Correct:Array = [0,0,0,0,0,0,0,0]
var score_Wrong:Array = [0,0,0,0,0,0,0,0]
var exam
var status:bool
var _show:bool = false
var _click:bool = false
func _ready():
	#$"/root/Global".Correct_Chapter1 = 2
	#$"/root/Global".Wrong_Chapter1 = 4
	exam = $"/root/MissionInventory"._save_exam
	show_score()
	chapter1_color = $"Correct/chapter 1".get_color("font_color")
	color_Wrong = $"Wrong/chapter 1".get_color("font_color")
	$Answer.hide()
	score()

func show_score():
	$"Correct/chapter 1".text = str(score_Correct[0]," ข้อ")
	$"Correct/chapter 2".text = str(score_Correct[1]," ข้อ")
	$"Correct/chapter 3".text = str(score_Correct[2]," ข้อ")
	$"Correct/chapter 4".text = str(score_Correct[3]," ข้อ")
	$"Correct/chapter 5".text = str(score_Correct[4]," ข้อ")
	$"Correct/chapter 6".text = str(score_Correct[5]," ข้อ")
	$"Correct/chapter 7".text = str(score_Correct[6]," ข้อ")
	$"Correct/chapter 8".text = str(score_Correct[7]," ข้อ")
	$"Wrong/chapter 1".text = str(score_Wrong[0]," ข้อ")
	$"Wrong/chapter 2".text = str(score_Wrong[1]," ข้อ")
	$"Wrong/chapter 3".text = str(score_Wrong[2]," ข้อ")
	$"Wrong/chapter 4".text = str(score_Wrong[3]," ข้อ")
	$"Wrong/chapter 5".text = str(score_Wrong[4]," ข้อ")
	$"Wrong/chapter 6".text = str(score_Wrong[5]," ข้อ")
	$"Wrong/chapter 7".text = str(score_Wrong[6]," ข้อ")
	$"Wrong/chapter 8".text = str(score_Wrong[7]," ข้อ")


func _on_Button_button_down():
	$"/root/Scene".scene($"/root/Global".scene)
	pass # Replace with function body.


func _input(event):
	if Input.is_action_pressed("mouse left") && _click:
		_answer_Correct(chapter,status)


func _on_chapter1_mouse_entered():
	chapter = "chapter1" #ตอบถูก
	status = true
	_click = true
	$"Correct/chapter 1".add_color_override("font_color",Color(1, 0.5, 0))
	pass # Replace with function body.


func _on_chapter1_mouse_exited():
	$"Correct/chapter 1".add_color_override("font_color",chapter1_color)
	chapter = null
	_click = false
	pass # Replace with function body.fal

func score():
	for i in exam.chapter1.size():
		if exam.chapter1[i].status == false:
			score_Wrong[0] += 1
		else:
			score_Correct[0] += 1
	
	for i in exam.chapter2.size():
		if exam.chapter2[i].status == false:
			score_Wrong[1] += 1
		else:
			score_Correct[1] += 1
	
	for i in exam.chapter2.size():
		if exam.chapter2[i].status == false:
			score_Wrong[2] += 1
		else:
			score_Correct[2] += 1
	
	for i in exam.chapter3.size():
		if exam.chapter3[i].status == false:
			score_Wrong[3] += 1
		else:
			score_Correct[3] += 1
	
	for i in exam.chapter4.size():
		if exam.chapter4[i].status == false:
			score_Wrong[4] += 1
		else:
			score_Correct[4] += 1
	
	for i in exam.chapter5.size():
		if exam.chapter5[i].status == false:
			score_Wrong[5] += 1
		else:
			score_Correct[5] += 1
	
	for i in exam.chapter6.size():
		if exam.chapter6[i].status == false:
			score_Wrong[6] += 1
		else:
			score_Correct[6] += 1
			
	for i in exam.chapter7.size():
		if exam.chapter7[i].status == false:
			score_Wrong[7] += 1
		else:
			score_Correct[7] += 1
	
	for i in exam.chapter8.size():
		if exam.chapter8[i].status == false:
			score_Wrong[8] += 1
		else:
			score_Correct[8] += 1
	show_score()

func _answer_Correct(_chapter,_status:bool):
	$Answer.show()
	if _chapter == "chapter1":
		if _status:
			for i in exam.chapter1.size():
				if exam.chapter1[i].status == true:
					$"/root/Global".question.append(exam.chapter1[i].question)
					$"/root/Global".correct.append(exam.chapter1[i].answer)
					$"/root/Global".Ans.append(str(i))
		elif not _status:
			for i in exam.chapter1.size():
				if exam.chapter1[i].status == false:
					$"/root/Global".question.append(exam.chapter1[i].question)
					$"/root/Global".correct.append(exam.chapter1[i].answer)
					$"/root/Global".Ans.append(str(i))
	if not _show:
		$Answer._ready()
		_show = true
	



func _on_chapter10_mouse_entered():
	chapter = "chapter1" #ตอบถูก
	status = false
	_click = true
	$"Wrong/chapter 1".add_color_override("font_color",Color(1, 0.5, 0))
	pass # Replace with function body.


func _on_chapter10_mouse_exited():
	$"Wrong/chapter 1".add_color_override("font_color",color_Wrong)
	chapter = null
	_click = false
	pass # Replace with function body.





func _on_chapter2Correct2_mouse_entered():
	chapter = "chapter2" #ตอบถูก
	status = true
	_click = true
	$"Correct/chapter 2".add_color_override("font_color",Color(1, 0.5, 0))
	pass # Replace with function body.


func _on_chapter2Correct2_mouse_exited():
	$"Correct/chapter 2".add_color_override("font_color",chapter1_color)
	chapter = null
	_click = false
	pass # Replace with function body.


func _on_chapter3Correct3_mouse_entered():
	chapter = "chapter3" #ตอบถูก
	status = true
	_click = true
	$"Correct/chapter 3".add_color_override("font_color",Color(1, 0.5, 0))
	pass # Replace with function body.


func _on_chapter3Correct3_mouse_exited():
	$"Correct/chapter 3".add_color_override("font_color",chapter1_color)
	chapter = null
	_click = false
	pass # Replace with function body.


func _on_chapter4Correct4_mouse_entered():
	chapter = "chapter4" #ตอบถูก
	status = true
	_click = true
	$"Correct/chapter 4".add_color_override("font_color",Color(1, 0.5, 0))
	pass # Replace with function body.


func _on_chapter4Correct4_mouse_exited():
	$"Correct/chapter 4".add_color_override("font_color",chapter1_color)
	chapter = null
	_click = false
	pass # Replace with function body.


func _on_chapter5Correct5_mouse_entered():
	chapter = "chapter5" #ตอบถูก
	status = true
	_click = true
	$"Correct/chapter 5".add_color_override("font_color",Color(1, 0.5, 0))
	pass # Replace with function body.


func _on_chapter5Correct5_mouse_exited():
	$"Correct/chapter 5".add_color_override("font_color",chapter1_color)
	chapter = null
	_click = false
	pass # Replace with function body.


func _on_chapter6Correct6_mouse_entered():
	chapter = "chapter6" #ตอบถูก
	status = true
	_click = true
	$"Correct/chapter 6".add_color_override("font_color",Color(1, 0.5, 0))
	pass # Replace with function body.


func _on_chapter6Correct6_mouse_exited():
	$"Correct/chapter 6".add_color_override("font_color",chapter1_color)
	chapter = null
	_click = false
	pass # Replace with function body.


func _on_chapter7Correct7_mouse_entered():
	chapter = "chapter7" #ตอบถูก
	status = true
	_click = true
	$"Correct/chapter 7".add_color_override("font_color",Color(1, 0.5, 0))
	pass # Replace with function body.


func _on_chapter7Correct7_mouse_exited():
	$"Correct/chapter 7".add_color_override("font_color",chapter1_color)
	chapter = null
	_click = false
	pass # Replace with function body.


func _on_chapter8Correct8_mouse_entered():
	chapter = "chapter8" #ตอบถูก
	status = true
	_click = true
	$"Correct/chapter 8".add_color_override("font_color",Color(1, 0.5, 0))
	pass # Replace with function body.


func _on_chapter8Correct8_mouse_exited():
	$"Correct/chapter 8".add_color_override("font_color",chapter1_color)
	chapter = null
	_click = false
	pass # Replace with function body.


func _on_chapter2Wrong2_mouse_entered():
	chapter = "chapter2" #ตอบถูก
	status = false
	_click = true
	$"Wrong/chapter 2".add_color_override("font_color",Color(1, 0.5, 0))
	pass # Replace with function body.


func _on_chapter2Wrong2_mouse_exited():
	$"Wrong/chapter 2".add_color_override("font_color",color_Wrong)
	chapter = null
	_click = false
	pass # Replace with function body.


func _on_chapter3Wrong3_mouse_entered():
	chapter = "chapter3" #ตอบถูก
	status = false
	_click = true
	$"Wrong/chapter 3".add_color_override("font_color",Color(1, 0.5, 0))
	pass # Replace with function body.


func _on_chapter3Wrong3_mouse_exited():
	$"Wrong/chapter 3".add_color_override("font_color",color_Wrong)
	chapter = null
	_click = false
	pass # Replace with function body.


func _on_chapter4Wrong4_mouse_entered():
	chapter = "chapter4" #ตอบถูก
	status = false
	_click = true
	$"Wrong/chapter 4".add_color_override("font_color",Color(1, 0.5, 0))
	pass # Replace with function body.


func _on_chapter4Wrong4_mouse_exited():
	$"Wrong/chapter 4".add_color_override("font_color",color_Wrong)
	chapter = null
	_click = false
	pass # Replace with function body.


func _on_chapter5Wrong5_mouse_entered():
	chapter = "chapter5" #ตอบถูก
	status = false
	_click = true
	$"Wrong/chapter 5".add_color_override("font_color",Color(1, 0.5, 0))
	pass # Replace with function body.


func _on_chapter5Wrong5_mouse_exited():
	$"Wrong/chapter 5".add_color_override("font_color",color_Wrong)
	chapter = null
	_click = false
	pass # Replace with function body.


func _on_chapter6Wrong6_mouse_entered():
	chapter = "chapter6" #ตอบถูก
	status = false
	_click = true
	$"Wrong/chapter 6".add_color_override("font_color",Color(1, 0.5, 0))
	pass # Replace with function body.


func _on_chapter6Wrong6_mouse_exited():
	$"Wrong/chapter 6".add_color_override("font_color",color_Wrong)
	chapter = null
	_click = false
	pass # Replace with function body.


func _on_chapter7Wrong7_mouse_entered():
	chapter = "chapter7" #ตอบถูก
	status = false
	_click = true
	$"Wrong/chapter 7".add_color_override("font_color",Color(1, 0.5, 0))
	pass # Replace with function body.


func _on_chapter7Wrong7_mouse_exited():
	$"Wrong/chapter 7".add_color_override("font_color",color_Wrong)
	chapter = null
	_click = false
	pass # Replace with function body.


func _on_chapter8Wrong8_mouse_entered():
	chapter = "chapter8" #ตอบถูก
	status = false
	_click = true
	$"Wrong/chapter 8".add_color_override("font_color",Color(1, 0.5, 0))
	pass # Replace with function body.


func _on_chapter8Wrong8_mouse_exited():
	$"Wrong/chapter 8".add_color_override("font_color",color_Wrong)
	chapter = null
	_click = false
	pass # Replace with function body.
