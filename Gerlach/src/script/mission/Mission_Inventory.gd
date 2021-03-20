extends Node2D
export (Resource) var chapter1_mission
export (Script) var chapter2_mission
var number:Array
var enemys:Array
#---------------------------------------------------------------------
#Type
onready var type_angle = load("res://src/scene/EnemyType/angle.tscn")
onready var type_Rounding_number = load("res://src/scene/EnemyType/Rounding_number.tscn")
onready var type_Sort = load("res://src/scene/EnemyType/Sort.tscn")
onready var type_simple = load("res://src/scene/EnemyType/Simple.tscn")
#---------------------------------------------------------------------
#Enemy
onready var Enemy_Tree = load("res://src/scene/Enemy/Tree.tscn")

func mission(chapter:String):
	if chapter == "chapter1":
		for i in chapter1_mission.mission_number.size():
			number.append(chapter1_mission.mission_number[i])
			enemys.append(chapter1_mission.Enemy[i])

