extends Node2D


func scene(chapter:int):
	if chapter == 1:
		get_tree().change_scene("res://src/scene/chapter1.tscn")
	if chapter == 2:
		get_tree().change_scene("res://src/scene/chapter2.tscn")

func Type(value:int):
	if value == 0:
		get_tree().change_scene("res://src/scene/EnemyType/Rounding_number.tscn")
	if value == 1:
		get_tree().change_scene("res://src/scene/EnemyType/Sort.tscn")
	if value == 2:
		get_tree().change_scene("res://src/scene/EnemyType/Simple.tscn")

func Enemy(value:String):
	var inst
	if value == "tree":
		inst = load("res://src/scene/Enemy/Tree.tscn").instance()
	elif value == "monster1":
		inst = load("res://src/scene/Enemy/Monster1.tscn").instance()
	inst.position = Vector2(247,144)
	return inst
	
