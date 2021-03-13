extends Node2D
var enemys = preload("res://assets/Enemys/Enemys.tres")
var Enemy_index #ตำแน่งสตรูใน Array
var player_damage
var damage
var timeend = true
var C = false
var dic_exam
func _ready():
	dic_exam = $"/root/Global".dic_Correct_Chapter1
	set_enemy()
	$HUDPlayer/ColorRect.show()
	$HUDPlayer/Label.show()
	pass
func _process(delta):
	if $HUDEnemy/TextureProgress.value <= 0 && C:
		#print($"/root/Global".mission)
		Events.emit_signal("hit",$"/root/Global".mission)
		Events.emit_signal("Test")
		$"/root/Global".mission_complete.append($"/root/Global".L_mission)
		Events.emit_signal("score","Correct")
		add_exam()
		C = false
		if timeend:
			$Timer.start()
			timeend = false
		#get_tree().change_scene("res://src/scene/chapter1.tscn")
		
	if $HUDPlayer/TextureProgress.value <= 0:
		if timeend:
			$"/root/Global".PlayerHP -= 20
			$Timer.start()
			Events.emit_signal("score","Wrong")
			$AnimationPlayer.play("Death")
			timeend = false
			
	
func set_enemy(): #ค้นหาสตรูและแสดงผล
	for i in enemys.Enemy.size():
		if enemys.Enemy[i].Mission == $"/root/Global".L_mission: #เปลี่ยบเทียบ
			#$Enemy.texture = enemys.Enemy[i].texture
			damage = enemys.Enemy[i].damage
			Enemy($"/root/Global".Enemy_Name,$"/root/Global".L_mission,$Enemy.rect_position,damage)
			

	pass
func _Correct(damages): #ตอบคำถามผิด
	$HUDEnemy/TextureProgress.value -= damages 
	print($HUDEnemy/TextureProgress.value)
	C = true
	pass
func _not_correct(damages): #ตอยคพถาทผิด
	$HUDPlayer/TextureProgress.value -= damages
	pass

func Enemy(name,mission,position,damage):
	if name == "Tree": #ชื่อของสตรูว่า Tree 
		var instree = load("res://src/scene/Enemy/Tree.tscn").instance()
		instree.Ename = name
		instree.mission = mission
		instree.position = position
		instree.damage = damage
		add_child(instree)


func _on_Timer_timeout():
	$"/root/Global".chapter1_Start = false
	Events.emit_signal("change",$"/root/Global".scene)
	#get_tree().change_scene("res://src/scene/chapter1.tscn")
	#get_tree().change_scene("res://src/scene/chapter2.tscn")
	pass # Replace with function body.

func add_exam():
	Events.emit_signal("add_exam",dic_exam["Type"],dic_exam["chapter"])
	pass
