extends Node2D
#change_Exam
var answers

func _ready():
	Events.connect("score",self,"score")
	Events.connect("change",self,"change")
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
			print($"/root/Global".Correct_Chapter1,"Correct")
		if answers == "Wrong":
			$"/root/Global".Wrong_Chapter1 += 1
			answers = null
			print($"/root/Global".Wrong_Chapter1,"Wrong")
		pass
	pass
func score(answer):
	answers = answer
	pass
