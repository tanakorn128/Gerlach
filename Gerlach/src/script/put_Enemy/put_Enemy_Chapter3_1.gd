extends Node2D
var count:int
var inst
var fire1
var fire2

onready var chapter3_2 = $"/root/MissionInventory"
func _ready():
	$"/root/Global".number_enemy = 3
	count = chapter3_2.all_chapter[3].dic.size() #chapter2
	putenemy()

func putenemy():
	for i in count:
		if not chapter3_2.chapters(4,i,"finish"):
			inst = load("res://src/scene/Enemy/Monster1.tscn").instance()
			fire1 = load("res://src/scene/animation/fire .tscn").instance()
			fire2 = load("res://src/scene/animation/fire .tscn").instance()
			fire1.position = chapter3_2.chapters(4,i,"fire1")
			fire2.position = chapter3_2.chapters(4,i,"fire2")
			inst.position = chapter3_2.chapters(4,i,"pos")
			inst.type_enemy = chapter3_2.chapters(4,i,"type")
			inst.number_index = i
			add_child(inst)
			add_child(fire1)
			add_child(fire2)


