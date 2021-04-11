extends Node2D
var count:int
var inst
var fire1
var fire2
var Enemy_index:int = 2
onready var chapter2 = $"/root/MissionInventory"
var id

func _ready():
	$"/root/Global".number_enemy = 2
	putenemy()

func putenemy():
	count = chapter2.all_chapter[Enemy_index].dic.size() #chapter2
	for i in count:
		id = chapter2.chapters(Enemy_index+1,i,"id")
		if not $"/root/MissionInventory"._save_mission.save[id]:
			inst = load("res://src/scene/Enemy/Monster1.tscn").instance()
			fire1 = load("res://src/scene/animation/fire .tscn").instance()
			fire2 = load("res://src/scene/animation/fire .tscn").instance()
			fire1.position = chapter2.chapters(Enemy_index+1,i,"fire1")
			fire2.position = chapter2.chapters(Enemy_index+1,i,"fire2")
			inst.position = chapter2.chapters(Enemy_index+1,i,"pos")
			inst.type_enemy = chapter2.chapters(Enemy_index+1,i,"type")
			inst.number_index = id
			add_child(inst)
			add_child(fire1)
			add_child(fire2)
