extends Node2D
var count:int
var inst
onready var chapter = $"/root/MissionInventory"
func _ready():
	$"/root/Global".number_enemy = 9
	count = chapter.all_chapter[9].dic.size()
	putenemy()

func putenemy():
	for i in count:
		if not chapter.chapters(10,i,"finish"):
			inst = load("res://src/scene/Enemy/Monster1.tscn").instance()
			inst.position = chapter.chapters(10,i,"pos")
			inst.type_enemy = chapter.chapters(10,i,"type")
			inst.number_index = i
			add_child(inst)
