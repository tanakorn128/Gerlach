extends Node2D
var count:int
var inst
onready var chapter5_3 = $"/root/MissionInventory"
func _ready():
	count = chapter5_3.all_chapter[8].dic.size() #chapter2
	putenemy()

func putenemy():
	
	for i in count:
		if not chapter5_3.chapters(9,i,"finish"):
			inst = load("res://src/scene/Enemy/soldier3.tscn").instance()
			inst.position = chapter5_3.chapters(9,i,"pos")
			inst.type_enemy = chapter5_3.chapters(9,i,"type")
			inst.number_index = i
			inst._scene = 8
			inst._dialogbox = "chapter5_3_dialogbox1"
			inst.savedialog = false
			add_child(inst)
