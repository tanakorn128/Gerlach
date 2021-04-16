extends Node2D
var count:int
var inst
onready var chapter = $"/root/MissionInventory"
var Enemy_index:int = 7
var id
var _Enemy:int

func putenemy():
	$"/root/Global".number_enemy = Enemy_index
	count = chapter.all_chapter[Enemy_index].dic.size()
	for i in count:
		id = chapter.chapters(Enemy_index+1,i,"id")
		if not $"/root/MissionInventory"._save_mission.save[id]:
			inst = load("res://src/scene/Enemy/Monster1.tscn").instance()
			inst.position = chapter.chapters(Enemy_index+1,i,"pos")
			inst.type_enemy = chapter.chapters(Enemy_index+1,i,"type")
			inst.number_index = id
			add_child(inst)
			_Enemy += 1
