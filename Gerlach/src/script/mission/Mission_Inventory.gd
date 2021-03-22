extends Node2D
export (Resource) var chapter1

#---------------------------------------------------------------------
#Type
onready var type_angle = load("res://src/scene/EnemyType/angle.tscn")
onready var type_Rounding_number = load("res://src/scene/EnemyType/Rounding_number.tscn")
onready var type_Sort = load("res://src/scene/EnemyType/Sort.tscn")
onready var type_simple = load("res://src/scene/EnemyType/Simple.tscn")
#---------------------------------------------------------------------

#---------------------------------------------------------------------
#Enemy
onready var Enemy_Tree = load("res://src/scene/Enemy/Tree.tscn")
onready var Enemy_Monster1 = load("res://src/scene/Enemy/Monster1.tscn")

func _ready():
	
	#chapter1.dic[0]["finish"] = true
	#print(chapters(1,"damage"))
	#ResourceSaver.save(chapter1.get_path(),chapter1)
	pass

func set_value(Chapter:int,index:int,value:String,Vchange):
	chapter1.dic[index][value] = Vchange

func chapters(Chapter:int,index:int,value:String):
	if Chapter == 1:
		return chapter1.dic[index][value]


