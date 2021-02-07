extends Node2D

var Mission_Inventory = preload("res://assets/Mission/Mission.tres")
export (Array) var ListMission1 #Mission Enemy
export (Array) var Enemy_location
export (Array) var Enemy_name
export (Array) var damage
export (Array) var texture
export (Array) var EnemyType
func _ready():
	set_mission()
	pass

func set_mission():
	var mission_size = Mission_Inventory.Mission.size()
	var mission_Enemy =  Mission_Inventory.Mission[0].Enemy #มาที Enemys.gd
	#ดึงข้อมูล Enemy รายตัวมาใช้ Mission ช่องที่ 0
	
	for i in mission_Enemy.size():
		ListMission1.append(mission_Enemy[i].Mission) 
		Enemy_location.append(mission_Enemy[i].location)
		Enemy_name.append(mission_Enemy[i].name)
		damage.append(mission_Enemy[i].damage)
		texture.append(mission_Enemy[i].texture)
		EnemyType.append(mission_Enemy[i].Enemy_Type)

		pass

	pass
func MissionSuccess():
	var mission = $"/root/Global".mission
	if $"/root/Global".mission_Success == true:
		Events.emit_signal("hit",mission)
	pass

func get_mission():
	return ListMission1
	pass

func get_name():
	return Enemy_name
	pass

func get_position():
	return Enemy_location
	pass

func get_damage():
	return damage

func get_texture():
	return texture

func get_EnemyType():
	return EnemyType
	pass
