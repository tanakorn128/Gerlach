extends Node2D
var Enemy_index:int = 4
onready var chapter = $"/root/MissionInventory"
var id
var inst

func _ready():
	soldier()

func soldier():
	var count = chapter.all_chapter[Enemy_index].dic.size()
	for i in count:
		if not $"/root/MissionInventory"._save_mission.save[22]  && not $"/root/MissionInventory"._save_dialogbox.save[23]:
			inst = load("res://src/scene/Enemy/soldier1.tscn").instance()
			inst.position = chapter.chapters(Enemy_index+1,0,"pos")
			inst._dialogbox = "chapter4_2_soldier1"
			inst.text = "ทหารคนที่ 1"
			add_child(inst)
		if $"/root/MissionInventory"._save_dialogbox.save[22] && not $"/root/MissionInventory"._save_dialogbox.save[23]:
			inst = load("res://src/scene/Enemy/soldier1.tscn").instance()
			inst.position = chapter.chapters(Enemy_index+1,1,"pos")
			inst._dialogbox = "chapter4_2_soldier2"
			add_child(inst)
	
