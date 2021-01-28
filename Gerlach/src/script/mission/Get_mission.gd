extends Node2D

var mission_complete

func _ready():
	var mission_all = $"/root/MissionInventory".get_mission()
	mission_complete = $"/root/Global".mission_complete
	for i in mission_all.size():
		if delete_mission(mission_all[i],mission_all.size()):
			Labels(i,mission_all[i])
	pass

func Labels(num,value):
	if num == 0:
		$GridContainer/Label1.text = value
	if num == 1:
		$GridContainer/Label2.text = value
	if num == 2:
		$GridContainer/Label3.text = value
	if num == 3:
		$GridContainer/Label4.text = value
	pass

func delete_mission(m,EnemyAll):
	var mission_complete = $"/root/Global".mission_complete
	for i in mission_complete.size():
		if mission_complete[i] == m:
			return false
			#print(mission_complete[i]," ",i)
	return true
