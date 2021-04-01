extends Node2D
func _ready():
	
	
	
	pass
func soldier():
	var soldier = load("res://src/scene/Enemy/soldier1.tscn").instance()
	soldier.position = Vector2(3346.72,-1516.434)
	soldier._dialogbox = "chapter3_2_end"
	add_child(soldier)
