extends Node2D
export (Array) var enemys #Enemy ทั้งหมด
func _ready(): #Create สตรูทั้งหมด
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
		var damage = $"/root/MissionInventory".get_damage()[i]
		if delete_mission(mission,enemys.size()):
			Enemy(str(name),mission,position,damage)


func mission_All():
	var mission = $"/root/MissionInventory".get_mission()
	return mission

func Enemy(name,mission,position,damage):
	if name == "Tree": #ชื่อของสตรูว่า Tree 
		var instree = load("res://src/scene/Enemy/Tree.tscn").instance()
		instree.Ename = name
		instree.mission = mission
		instree.position = position
		instree.damage = damage
		add_child(instree)
	
func delete_mission(m,EnemyAll):
	var mission_complete = $"/root/Global".mission_complete
	for i in mission_complete.size():
		if mission_complete[i] == m:
			return false
			#print(mission_complete[i]," ",i)
	return true
	
