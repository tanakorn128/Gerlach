extends Node2D
var count:int
var inst
onready var chapter4_2 = $"/root/MissionInventory"

func _ready():
	count = chapter4_2.all_chapter[5].dic.size()
	
	putenemy()

func putenemy():
	
	for i in count:
		if not chapter4_2.chapters(2,i,"finish"):
			inst = load("res://src/scene/Enemy/soldier2.tscn").instance()
			inst.position = chapter4_2.chapters(6,i,"pos")
			inst.type_enemy = chapter4_2.chapters(6,i,"type")
			inst.number_index = i
			inst._scene = 5
			inst._dialogbox = "chapter4_2_soldiers1"
			add_child(inst)
