extends Node2D
var pos
func _ready():
	position.x = 438.103
	position.y = 455.701
	Events.connect("player_position",self,"player_position") #เชื่อมสัญญาณ player_position
func _process(delta):
	pass

func _on_Area2D_body_entered(body):
	_hide() 
	exam()
	#get_tree().change_scene("res://src/scene/Exam.tscn")
	pass # Replace with function body.

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

func player_position(position):
	pos = position # ตำแหน่งผู้เล่น
	
	pass
