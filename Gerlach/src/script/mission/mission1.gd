extends Node2D
var pos
var mission
var Ename
var CollisioionPlayer = false
func _ready():
	$Tree.play("idle")
	$Tree.frame = 0

	Events.connect("player_position",self,"player_position") #เชื่อมสัญญาณ player_position
	Events.connect("player_Collisioion_mission",self,"Collisioion")
	Events.connect("hit",self,"hit")
	pass
func hit(hit_mission):
	if mission == hit_mission:
		queue_free()
	pass
func _on_Area2D_body_entered(body):
	if CollisioionPlayer:
		exam()
	#get_tree().change_scene("res://src/scene/Exam.tscn")
	pass # Replace with function body.
	
func Collisioion(Collisioion):
	CollisioionPlayer = Collisioion
	pass
func exam():
	speed_player()
	$"/root/Global".mission = mission
	$"/root/Global".Enemy_Name = Ename
	get_tree().change_scene("res://src/scene/Exam.tscn")


func speed_player():
	Events.emit_signal("player_speed",0)
	pass

func player_position(position):

	pass
