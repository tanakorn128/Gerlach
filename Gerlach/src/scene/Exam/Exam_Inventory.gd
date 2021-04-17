extends Node2D
var exam1 = load("res://src/script/Exam/group/group1.tres") #Exam_Group
var exam2 = load("res://src/script/Exam/group/group2.tres")
var exam3 = load("res://src/script/Exam/group/group3.tres")
var random_exam1:Array = exam1.Exam_Group
var random_exam2:Array = exam2.Exam_Group
var random_exam3:Array = exam3.Exam_Group
var index_Exam1:int = -1
var index_Exam2:int = -1
var index_Exam3:int = -1
var _Exam #ข้อสอบ
func _ready():
	random()
	pass

func exam(group:int):
	if group == 1:
		return random_exam1
	if group == 2:
		return random_exam2
	if group == 3:
		return random_exam3


func index(group:int):
	if group == 1:
		if index_Exam1 >= exam1.Exam_Group.size()-1:
			index_Exam1 = 0
			random_exam1.shuffle()
		else:
			index_Exam1 += 1
		return index_Exam1
	if group == 2:
		if index_Exam2 >= exam2.Exam_Group.size()-1:
			index_Exam2 = 0
			random_exam2.shuffle()
		index_Exam2 += 1
		return index_Exam2
	if group == 3:
		if index_Exam3 >= exam3.Exam_Group.size()-1:
			index_Exam3 = 0
			random_exam3.shuffle()
		index_Exam3 += 1
		return index_Exam3
	


func random(): #สุ่มตัวเลข
	randomize()
	random_exam1.shuffle()
	random_exam2.shuffle()
	random_exam3.shuffle()
	#random_exam1.erase(random_exam1[0])
	#random_exam2.erase(random_exam1[0])
	#print(random_exam1.size())
