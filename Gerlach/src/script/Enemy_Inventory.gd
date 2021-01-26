extends Node2D
export (Array) var enemys #Enemy ทั้งหมด
func _ready():
	mission_All()
	set_Enemy()
	put_Enemy()
	pass

func set_Enemy(): # นำ Enemy ใส่ Array enemys
	for i in mission_All().size():
		enemys.append($"/root/MissionInventory".get_texture()[i])
		pass
	pass

func put_Enemy(): #นำ Enemy ใส่ใน Scene
	for i in enemys.size():
		var mission = $"/root/MissionInventory".get_mission()[i]
		var name = $"/root/MissionInventory".get_name()[i]
		var position = $"/root/MissionInventory".get_position()[i]
		Enemy(str(name),mission,position)


func mission_All():
	var mission = $"/root/MissionInventory".get_mission()
	return mission

func Enemy(name,mission,position):
	if name == "Tree":
		var instree = load("res://src/scene/Enemy/Tree.tscn").instance()
		instree.Ename = name
		instree.mission = mission
		instree.position = position
		add_child(instree)
