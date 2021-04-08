extends Node2D
var count:int
var count2:int
var ins
var _Enemys
onready var chapter1 = $"/root/MissionInventory"
onready var chapter1_1 = $"/root/MissionInventory"
var finished = false
var fire1
var fire2

func _ready():
	$"/root/Global".number_enemy = 0
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


func monster():
	count2 = chapter1_1.all_chapter[22].dic.size()
	print("Enemy2")
	for i in count2:
		if not chapter1_1.chapters(23,i,"finish"):
			ins = load("res://src/scene/Enemy/Monster1.tscn").instance()
			fire1 = load("res://src/scene/animation/fire .tscn").instance()
			fire2 = load("res://src/scene/animation/fire .tscn").instance()
			ins.position = $"/root/Global".Enemy_pos #$"/root/Global".Enemy_pos
			fire1.position = Vector2(632.115,522.831)
			fire2.position = Vector2(1043.644,526.606)
			ins.number_index = i
			$"/root/Global".number_enemy = 22
			ins.type_enemy=chapter1_1.chapters(23,i,"type")
			add_child(ins)
			add_child(fire1)
			add_child(fire2)

