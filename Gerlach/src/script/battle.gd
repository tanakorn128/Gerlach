extends Node2D
var enemys = preload("res://assets/Enemys/Enemys.tres")
var Enemy_index #ตำแน่งสตรูใน Array
var damage
var C = false
func _ready():
	Events.connect("answer1",self,"_Correct")
	Events.connect("answer2",self,"_not_correct")
	set_enemy()
	pass
func _process(delta):
	if $HUDEnemy/TextureProgress.value <= 0 && C:
		#print($"/root/Global".mission)
		Events.emit_signal("hit",$"/root/Global".mission)
		Events.emit_signal("Test")
		$"/root/Global".mission_complete.append($"/root/Global".L_mission)
		C = false
		#get_tree().change_scene("res://src/scene/chapter1.tscn")
		
	if $HUDPlayer/TextureProgress.value <= 0:
		get_tree().change_scene("res://src/scene/chapter1.tscn")
	
func set_enemy(): #ค้นหาสตรูและแสดงผล
	for i in enemys.Enemy.size():
		if enemys.Enemy[i].Mission == $"/root/Global".L_mission:
			#$Enemy.texture = enemys.Enemy[i].texture
			damage = enemys.Enemy[i].damage
			Enemy($"/root/Global".Enemy_Name,$"/root/Global".L_mission,$Enemy.rect_position,damage)
			
			#print(damage)

	pass
func _Correct(Correct): #ตอบคำถามผิด
	$HUDEnemy/TextureProgress.value -= int(damage)
	C = true
	pass
func _not_correct(not_correct): #ตอยคพถาทผิด
	$HUDPlayer/TextureProgress.value -=10
	pass

func Enemy(name,mission,position,damage):
	print(name)
	if name == "Tree": #ชื่อของสตรูว่า Tree 
		var instree = load("res://src/scene/Enemy/Tree.tscn").instance()
		instree.Ename = name
		instree.mission = mission
		instree.position = position
		instree.damage = damage
		add_child(instree)