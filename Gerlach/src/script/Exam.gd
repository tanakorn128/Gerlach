extends Node2D
var temp
export (Array) var exam
var ExamChapter1 = preload("res://src/script/Exam/Exam_All/Chapter1.tres")

func _ready():
	set_exam(ExamChapter1.ExamAll.size())
	import_exam()
	pass

func set_exam(size):
	for i in size:
		exam.append(ExamChapter1.ExamAll[i])
	pass

func get_Exam_Chapter(chapter):
	if chapter == 1:
		return exam
	pass

func _on_answer1_button_down():
	pass # Replace with function body.


func _on_answer2_button_down():
	pass # Replace with function body.


func _on_answer3_button_down():
	pass # Replace with function body.


func _on_answer4_button_down():
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

func _answer(correct,answer):
	
	if correct == answer:
		print("true")
		return true
	else:
		print("false")
		return false

func import_exam():
	var importexam = get_Exam_Chapter(1)
	var rng = random_exam(importexam.size()-1)
	_show(importexam[rng].Question,importexam[rng].answer1,importexam[rng].answer2,importexam[rng].answer3,importexam[rng].answer4)
	pass

func _on_Timer_timeout():
	if $TextureProgress.value > 0:
		$TextureProgress.value -= 10
	else:
		$TextureProgress.value = 60
		import_exam()
	pass # Replace with function body.
