extends Node2D
var count:int
var inst
var fire1
var fire2

onready var chapter2 = $"/root/MissionInventory"
func _ready():
	count = chapter2.all_chapter[1].dic.size() #chapter2
	putenemy()

func putenemy():
	
	for i in count:
		if not chapter2.chapters(2,i,"finish"):
			inst = load("res://src/scene/Enemy/Monster1.tscn").instance()
			fire1 = load("res://src/scene/animation/fire .tscn").instance()
			fire2 = load("res://src/scene/animation/fire .tscn").instance()
			fire1.position = chapter2.chapters(2,i,"fire1")
			fire2.position = chapter2.chapters(2,i,"fire2")
			inst.position = chapter2.chapters(2,i,"pos")
			inst.type_enemy = chapter2.chapters(2,i,"type")
			inst.number_index = i
			add_child(inst)
			add_child(fire1)
			add_child(fire2)
