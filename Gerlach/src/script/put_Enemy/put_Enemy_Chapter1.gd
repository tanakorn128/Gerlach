extends Node2D
var count:int
var ins
onready var chapter1 = $"/root/MissionInventory"
func _ready():
	count = chapter1.chapter1.dic.size()
	putenemy()
	ResourceSaver.save($"/root/MissionInventory".chapter1.get_path(),$"/root/MissionInventory".chapter1)

func putenemy():
	for i in count:
		if not chapter1.chapters(1,i,"finish"):
			ins = $"/root/MissionInventory".Enemy_Tree.instance()
			ins.position = chapter1.chapters(1,i,"pos")
			ins.number = i
			ins.type_enemy=chapter1.chapters(1,i,"type")
			$"/root/Global".Enemy_damage=chapter1.chapters(1,i,"damage")
			add_child(ins)