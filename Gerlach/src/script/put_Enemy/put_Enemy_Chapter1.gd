extends Node2D
var mission_number:Array
var enemys:Array
var location:Array
var Enemytype:Array
var missions:Array
func _ready():
	$"/root/MissionInventory".mission("chapter1")
	mission_number = $"/root/MissionInventory".number
	enemys = $"/root/MissionInventory".enemys
	if not missions.size():
		for i in mission_number.size():
			location.append(enemys[i].location)
			Enemytype.append(enemys[i].Enemy_Type)
			missions.append(false)
	putenemy()

func putenemy():
	var ins
	
	for i in mission_number.size():
		if missions:
			ins = $"/root/MissionInventory".Enemy_Tree.instance()
			ins.position = location[i]
			add_child(ins)



