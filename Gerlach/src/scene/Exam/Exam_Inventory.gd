extends Node2D

onready var angle
onready var sort
onready var simple
func _ready():
	angle = load("res://src/script/Exam/Exam_All/Angle.tres")
	sort = load("res://src/script/Exam/Exam_All/Sort.tres")
	simple = load("res://src/script/Exam/Exam_All/Chapter1.tres")
	get_angle()
	get_sort()
	get_simple()
	


func get_exam(type:String,topic:int,name:String):
	if type.to_lower() == "angle":
		if topic < angle.ExamAll.size():
			return get_angle()[topic][name]
		else:
			print("end of size array")
			return get_angle()[0]
	if type.to_lower() == "sort":
		return get_sort()[topic][name]
		pass
	if type.to_lower() == "simple":
		get_simple()


func get_angle():
	return angle.ExamAll

func get_size_angle():
	var sum:int = angle.ExamAll.size()
	return sum

func get_sort():
	var sum:int = sort.ExamAll.size()



func get_simple():
	var sum:int = simple.ExamAll.size()


