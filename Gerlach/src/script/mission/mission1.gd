extends Node2D
var pos
var mission #ชื่อภารกิจ
var Ename #ชื่อของสตรู
var CollisioionPlayer = false #ผู้เล่นชนกับสตรู
var damage #ความเสียหาย
var missiom_hit = false #ภารกิจสำเร็จเป็น True
var EnemyType
onready var animation_tree = get_node("AnimationTree")
onready var animation_node = animation_tree.get("parameters/playback")

func _ready():
	Events.connect("player_Collisioion_mission",self,"Collisioion")
	Events.connect("hit",self,"hit_mission")
	animation_node.start("start")
	
	#Events.connect("answer1",self,"_Correct")
	pass
func _Correct(Correct): #ตอบคำถามผิด
	#$Tree/Efect/Particles2D.emitting = true
	pass
func hit_mission(hit_mission):
	if mission == hit_mission:
		missiom_hit = true
		#$Tree.play("hit")
	pass
func hit(hit_mission): # ผู้เล่นชนะ Effect การตาย
	print(hit_mission)
	print("hit_mission")
	if mission == hit_mission:
		missiom_hit = true
		#$Tree.play("hit")


func _on_Area2D_body_entered(body):
	if CollisioionPlayer:
		$"/root/Global".player = self.position
		exam()
	#get_tree().change_scene("res://src/scene/Exam.tscn")
	pass # Replace with function body.
	
func Collisioion(Collisioion):
	CollisioionPlayer = Collisioion
	pass
func exam(): #เปลี่ยนฉากไปทำข้อสอย
	#ส่งออกข้่อมูลของสตรู
	$"/root/Global".mission = mission 
	$"/root/Global".Enemy_Name = Ename
	$"/root/Global".damage = damage
	$"/root/Global".L_mission = mission
	#เปลี่ยนฉาก
	if EnemyType == 0:
		get_tree().change_scene("res://src/scene/EnemyType/Simple.tscn")
	if EnemyType == 1:
		get_tree().change_scene("res://src/scene/EnemyType/Trash.tscn")
	if EnemyType == 2:
		get_tree().change_scene("res://src/scene/EnemyType/Sort.tscn")
	if EnemyType == 3:
		get_tree().change_scene("res://src/scene/EnemyType/angle.tscn")




func _on_Tree_animation_finished():
	if missiom_hit:
		queue_free()
		#get_tree().change_scene("res://src/scene/chapter1.tscn")
		get_tree().change_scene("res://src/scene/chapter2.tscn")
	pass # Replace with function body.


func _on_Timer_timeout():
	animation_node.travel("Flashing")
	pass # Replace with function body.


