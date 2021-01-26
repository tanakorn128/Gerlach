extends Node2D
var pos
var mission
var Ename
var CollisioionPlayer = false
func _ready():
	$Tree.play("idle")
	$Tree.frame = 0
	position.x = 438.103
	position.y = 455.701
	Events.connect("player_position",self,"player_position") #เชื่อมสัญญาณ player_position
	Events.connect("player_Collisioion_mission",self,"Collisioion")
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
	Events.emit_signal("HUD",false) # ซ่อน HUD
	var inst_exam = load("res://src/scene/Exam.tscn").instance()
	add_child(inst_exam)
	inst_exam.position.x = pos.x -150
	inst_exam.position.y = pos.y -130

func _hide():
	$TileMap.hide() #ซ่อน TileMap เมื่อแลดงข้อสอบ
	$Area2D.hide()# ซ่อน Area2D เมื่อแสดงข้อสอบ 
	pass

func _show():
	$TileMap.show()
	$Area2D.show()
	pass

func speed_player():
	Events.emit_signal("player_speed",0)
	pass

func player_position(position):
	pos = position
	
