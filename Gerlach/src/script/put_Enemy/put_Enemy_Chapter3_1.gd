extends Node2D
var count:int
var inst
var Enemy_index:int = 3
var id
onready var chapter = $"/root/MissionInventory"
func _ready():
	$"/root/Global".number_enemy = 3
	putenemy()

func putenemy():
	count = chapter.all_chapter[Enemy_index].dic.size() #chapter2
	for i in count:
		id = chapter.chapters(Enemy_index+1,i,"id")
		if not $"/root/MissionInventory"._save_mission.save[id]:
			inst = load("res://src/scene/Enemy/Monster1.tscn").instance()
			inst.position = chapter.chapters(Enemy_index+1,i,"pos")
			inst.type_enemy = 2
			inst.number_index = id
			add_child(inst)


