extends Node2D
func _ready():
	Events.connect("change",self,"change")
	
func change(scene):
	print(scene)
	if scene == 1: #chapter1
		get_tree().change_scene("res://src/scene/chapter1.tscn")
	if scene == 2: #chapter2
		get_tree().change_scene("res://src/scene/chapter2.tscn")
	pass
