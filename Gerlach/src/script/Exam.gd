extends Node2D
var temp
var mission
export (Array) var exam
var ExamChapter1 = preload("res://src/script/Exam/Exam_All/Chapter1.tres")
var correct
func _ready():
	Events.connect("answer1",self,"_Correct")
	Events.connect("answer2",self,"_not_correct")
	set_exam(ExamChapter1.ExamAll.size())
	import_exam()
	mission = $"/root/Global".mission
	
	pass

func set_exam(size): #นำเข้าข้อสอบจากภายนอก
	for i in size:
		exam.append(ExamChapter1.ExamAll[i])
	pass

func get_Exam_Chapter(chapter): #นำเข้าข้อสอบจากภายนอก
	if chapter == 1:
		return exam
	pass

func _on_answer1_button_down():
	_answer($answer1/Label.text,correct)
	pass # Replace with function body.


func _on_answer2_button_down():
	_answer($answer2/Label.text,correct)
	pass # Replace with function body.


func _on_answer3_button_down():
	_answer($answer3/Label.text,correct)
	pass # Replace with function body.


func _on_answer4_button_down():
	_answer($answer4/Label.text,correct)
	pass # Replace with function body.

func random_exam(value): #สุ่มตัวเลข
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var my_random_number : int = rng.randf_range(1, value)
	return my_random_number

func _show(question,answer1,answer2,answer3,answer4):
	$"Label question".text = str(question)
	$answer1/Label.text = str(answer1)
	$answer2/Label.text = str(answer2)
	$answer3/Label.text = str(answer3)
	$answer4/Label.text = str(answer4)
	pass

func _answer(correct,answer): #ตรวจคำตอบ
	
	if correct == answer:
		Events.emit_signal("answer1",true)
		return true
	else:
		Events.emit_signal("answer2",false)
		import_exam()
		return false

func import_exam(): # เลือก Chapter ของข้อสอบ
	var importexam = get_Exam_Chapter(1)
	var rng = random_exam(importexam.size()-1)
	_show(importexam[rng].Question,importexam[rng].answer1,importexam[rng].answer2,importexam[rng].answer3,importexam[rng].answer4)
	correct = importexam[rng].Correct
	pass
func _Correct(Correct):
	pass
func _not_correct(not_correct):
	pass
func _on_Timer_timeout():
	if $TextureProgress.value > 0:
		$TextureProgress.value -= 1
	else:
		$TextureProgress.value = 60
		import_exam()
	pass # Replace with function body.
