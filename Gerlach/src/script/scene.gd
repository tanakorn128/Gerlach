extends Node2D


func scene(scene:int):
	if scene == 1:
		get_tree().change_scene("res://src/scene/chapter1.tscn")
	if scene == 2:
		get_tree().change_scene("res://src/scene/chapter2.tscn")
	if scene == 3:
		get_tree().change_scene("res://src/scene/chapter3_1.tscn")
	if scene == 3:
		get_tree().change_scene("res://src/scene/chapter3_2.tscn")
	if scene == 4:
		get_tree().change_scene("res://src/scene/chapter4_1.tscn")
	if scene == 5:
		get_tree().change_scene("res://src/scene/chapter4_2.tscn")
	if scene == 6:
		get_tree().change_scene("res://src/scene/chapter5_1.tscn")
	if scene == 7:
		get_tree().change_scene("res://src/scene/chapter5_2.tscn")
	if scene == 8:
		get_tree().change_scene("res://src/scene/chapter5_3.tscn")
	if scene == 9:
		get_tree().change_scene("res://src/scene/chapter6_1.tscn")
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
	elif value == "soldler1":
		inst = load("res://src/scene/Enemy/soldier1.tscn").instance()
	elif value == "soldler2":
		inst = load("res://src/scene/Enemy/soldier2.tscn").instance()
	inst.position = Vector2(247,144)
	return inst
	
