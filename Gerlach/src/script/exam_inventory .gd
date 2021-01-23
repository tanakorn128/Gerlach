extends Node2D
export (Array) var exam
var ExamChapter1 = preload("res://src/script/Exam/Exam_All/Chapter1.tres")

func _ready():
	set_exam(ExamChapter1.ExamAll.size())
	pass

func set_exam(size):
	for i in size:
		exam.append(ExamChapter1.ExamAll[i])
	pass

func get_Exam_Chapter(chapter):
	if chapter == 1:
		return exam
	pass
