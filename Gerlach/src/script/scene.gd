extends Node2D


func scene(chapter:int):
	if chapter == 1:
		get_tree().change_scene("res://src/scene/chapter1.tscn")
	if chapter == 2:
		get_tree().change_scene("res://src/scene/chapter2.tscn")

func Type(value:int):
	print(value)
	if value == 0:
		get_tree().change_scene("res://src/scene/EnemyType/Rounding_number.tscn")
	if value == 1:
		get_tree().change_scene("res://src/scene/EnemyType/Sort.tscn")
	if value == 2:
		get_tree().change_scene("res://src/scene/EnemyType/Simple.tscn")
