extends Node2D
var enemys = preload("res://assets/Enemys/Enemys.tres")
var Enemy_index #ตำแน่งสตรูใน Array
var damage
func _ready():
	Events.connect("answer1",self,"_Correct")
	Events.connect("answer2",self,"_not_correct")
	set_enemy()
	pass
func _process(delta):
	if $HUDEnemy/TextureProgress.value <= 0:
		Events.emit_signal("hit",$"/root/Global".mission)
		#print($"/root/Global".L_mission)
		$"/root/Global".mission_complete.append($"/root/Global".L_mission)
		get_tree().change_scene("res://src/scene/chapter1.tscn")
	if $HUDPlayer/TextureProgress.value <= 0:
		get_tree().change_scene("res://src/scene/chapter1.tscn")
func set_enemy(): #ค้นหาสตรูและแสดงผล
	for i in enemys.Enemy.size():
		if enemys.Enemy[i].Mission == $"/root/Global".L_mission:
			$Enemy.texture = enemys.Enemy[i].texture
			damage = enemys.Enemy[i].damage
			#print(damage)

	pass
func _Correct(Correct): #ตอบคำถามผิด
	$HUDEnemy/TextureProgress.value -= int(damage)
	pass
func _not_correct(not_correct): #ตอยคพถาทผิด
	$HUDPlayer/TextureProgress.value -=10
	pass

