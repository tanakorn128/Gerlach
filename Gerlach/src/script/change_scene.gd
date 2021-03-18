extends Node2D
#change_Exam
var answers
var dic_exam
var arr_exam
var Angle_Chapter1
var arr_Angle_Chapter1
func _ready():
	dic_exam = $"/root/Global".dic_Correct_Chapter1
	arr_exam = $"/root/Global".arr_Correct_Chapter1
	Angle_Chapter1 = $"/root/Global".Angle_Chapter1
	arr_Angle_Chapter1 = $"/root/Global".arr_Angle_Chapter1
	Events.connect("score",self,"score")
	Events.connect("change",self,"change")
	Events.connect("add_exam",self,"add_exam")
func change(scene):
	if scene == 1: #chapter1
		get_tree().change_scene("res://src/scene/chapter1.tscn")
		add_score("chapter1")
	if scene == 2: #chapter2
		get_tree().change_scene("res://src/scene/chapter2.tscn")
	pass

func add_score(chapter):
	if chapter == "chapter1":
		if answers == "Correct":
			$"/root/Global".Correct_Chapter1 += 1
			answers = null
			
		if answers == "Wrong":
			$"/root/Global".Wrong_Chapter1 += 1
			answers = null
			
		pass
	pass
func add_exam(Type0,chapter0):
	dic_exam["data"]["Type"] = Type0
	dic_exam["data"]["chapter"] = chapter0
	add_dataExam(Type0)
	arr_exam.append(dic_exam["data"]["Type"])


func add_dataExam(Type):
	if Type == "จับคู่มุม":
		
		#arr_Angle_Chapter1.append(Angle_Chapter1["data"])
		pass
	pass
func score(answer):
	answers = answer
	pass
