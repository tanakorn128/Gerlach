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
var Enemy_index1:int = 0
var Enemy_index2:int = 1
var id

func _ready():
	$"/root/Global".number_enemy = Enemy_index1
	putenemy()

func putenemy():
	count = chapter1.all_chapter[Enemy_index1].dic.size()
	for i in count:
		id = chapter1_1.chapters(Enemy_index1+1,i,"id")
		if not $"/root/MissionInventory"._save_mission.save[id]:
			ins = $"/root/MissionInventory".Enemy_Tree.instance()
			ins.position = chapter1.chapters(Enemy_index1+1,i,"pos")
			ins.number_index = id
			ins.type_enemy=chapter1.chapters(Enemy_index1+1,i,"type")
			$"/root/Global".Enemy_damage=chapter1.chapters(Enemy_index1+1,i,"damage")
			add_child(ins)


func monster():
	count2 = chapter1_1.all_chapter[Enemy_index2].dic.size()
	for i in count2:
		id = chapter1_1.chapters(Enemy_index2+1,i,"id")
		if not $"/root/MissionInventory"._save_mission.save[id]:
			ins = load("res://src/scene/Enemy/Monster1.tscn").instance()
			fire1 = load("res://src/scene/animation/fire .tscn").instance()
			fire2 = load("res://src/scene/animation/fire .tscn").instance()
			ins.position = $"/root/Global".Enemy_pos #$"/root/Global".Enemy_pos
			fire1.position = Vector2(632.115,522.831)
			fire2.position = Vector2(1043.644,526.606)
			ins.number_index = id
			print($"/root/MissionInventory"._save_mission.save[id])
			$"/root/Global".number_enemy = Enemy_index2
			ins.type_enemy=chapter1_1.chapters(Enemy_index2+1,i,"type")
			add_child(ins)
			add_child(fire1)
			add_child(fire2)

