extends Node2D
var count:int
var inst


onready var chapter5_3 = $"/root/MissionInventory"
func _ready():
	count = chapter5_3.all_chapter[3].dic.size() #chapter2
	putenemy()

func putenemy():
	for i in count:
		if not chapter5_3.chapters(4,i,"finish"):
			inst = load("res://src/scene/Enemy/npc1.tscn").instance()
			inst.number_index = i
			inst.position = chapter5_3.chapters(4,i,"pos")
			add_child(inst)
