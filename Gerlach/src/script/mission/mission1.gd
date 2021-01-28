extends Node2D
var pos
var mission #ชื่อภารกิจ
var Ename #ชื่อของสตรู
var CollisioionPlayer = false #ผู้เล่นชนกับสตรู
var damage #ความเสียหาย
var missiom_hit = false #ภารกิจสำเร็จเป็น True
func _ready():
	$Tree.play("idle")
	$Tree.frame = 0
	Events.connect("player_position",self,"player_position") #เชื่อมสัญญาณ player_position
	Events.connect("player_Collisioion_mission",self,"Collisioion")
	Events.connect("hit",self,"hit_mission")
	Events.connect("Test",self,"Test")
	pass
func Test():
	#print("Test")
	pass
func hit_mission(hit_mission):
	if mission == hit_mission:
		missiom_hit = true
		$Tree.play("hit")
	pass
func hit(hit_mission): # ผู้เล่นชนะ Effect การตาย
	print(hit_mission)
	print("hit_mission")
	if mission == hit_mission:
		missiom_hit = true
		$Tree.play("hit")
	pass

func _on_Area2D_body_entered(body):
	if CollisioionPlayer:
		exam()
	#get_tree().change_scene("res://src/scene/Exam.tscn")
	pass # Replace with function body.
	
func Collisioion(Collisioion):
	CollisioionPlayer = Collisioion
	pass
func exam(): #เปลี่ยนฉากไปทำข้อสอย
	speed_player()
	#ส่งออกข้่อมูลของสตรู
	$"/root/Global".mission = mission 
	$"/root/Global".Enemy_Name = Ename
	$"/root/Global".damage = damage
	$"/root/Global".L_mission = mission
	#เปลี่ยนฉาก
	get_tree().change_scene("res://src/scene/Exam.tscn")


func speed_player(): # ความเร็วผู้เล่นเป็น 0
	Events.emit_signal("player_speed",0)
	pass

func player_position(position):

	pass

func _on_Tree_animation_finished():
	if missiom_hit:
		queue_free()
		get_tree().change_scene("res://src/scene/chapter1.tscn")
	pass # Replace with function body.
