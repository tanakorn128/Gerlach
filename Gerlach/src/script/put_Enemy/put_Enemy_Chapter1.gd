extends Node2D
var count:int
var ins

onready var chapter1 = $"/root/MissionInventory"
func _ready():
	putenemy()

func putenemy():
	count = chapter1.all_chapter[0].dic.size()
	for i in count:
		if not chapter1.chapters(1,i,"finish"):
			ins = $"/root/MissionInventory".Enemy_Tree.instance()
			ins.position = chapter1.chapters(1,i,"pos")
			ins.number_index = i
			ins.type_enemy=chapter1.chapters(1,i,"type")
			$"/root/Global".Enemy_damage=chapter1.chapters(1,i,"damage")
			add_child(ins)

