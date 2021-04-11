extends Node2D
export (Array,Resource) var all_chapter
var _save_mission #= load("user://mission/mission.tres")
var _dialogbox = load("res://src/scene/dialogbox/all.tres")
var _save_dialogbox #= load("user://dialogbox/dialogbox.tres")
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

#ตั้วอย่างการ Save ไฟล์
	#chapter1.dic[0]["finish"] = true
	#print(chapters(1,"damage"))
	#ResourceSaver.save(chapter1.get_path(),chapter1)
func _ready():
	loadresorce()
	_save_dialogbox = load("user://dialogbox/dialogbox.tres")
	_save_mission = load("user://mission/mission.tres")

func set_value(Chapter:int,index:int,value:String,Vchange):
	all_chapter[Chapter-1].dic[index][value] = Vchange


func chapters(scene:int,index:int,value:String): #เช่น chapter2 ใส่ 2
	return all_chapter[scene-1].dic[index][value]
 
func loadresorce():
	var dir = Directory.new()
	if not dir.dir_exists("user://dialogbox"):
		dir.make_dir_recursive("user://dialogbox")
		ResourceSaver.save("user://dialogbox/dialogbox.tres",load("res://src/save/doalogbox.tres"))
	if not dir.dir_exists("user://mission"):
		dir.make_dir_recursive("user://mission")
		ResourceSaver.save("user://mission/mission.tres",load("res://src/save/mission.tres"))
	
	

