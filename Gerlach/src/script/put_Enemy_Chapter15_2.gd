extends Node2D
var count:int
var inst
var fire1
var fire2

onready var chapter8 = $"/root/MissionInventory"
func _ready():
	$"/root/Global".number_enemy = 3
	count = chapter8.all_chapter[21].dic.size() #chapter2
	putenemy()

func putenemy():
	for i in count:
		if not chapter8.chapters(22,i,"finish"):
			inst = load("res://src/scene/Enemy/Monster1.tscn").instance()
			inst.position = chapter8.chapters(22,i,"pos")
			inst.type_enemy = chapter8.chapters(22,i,"type")
			inst.number_index = i
			add_child(inst)


