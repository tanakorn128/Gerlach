extends Node2D
var enemys = preload("res://assets/Enemys/Enemys.tres")
var Enemy_index
func _ready():
	Events.connect("answer1",self,"_Correct")
	Events.connect("answer2",self,"_not_correct")
	print($"/root/Global".Enemy_Name)
	set_enemy()
	pass
func set_enemy():
	for i in enemys.Enemy.size():
		if enemys.Enemy[i].name == $"/root/Global".Enemy_Name:
			$Enemy.texture = enemys.Enemy[i].texture

	pass
func _Correct(Correct):
	print("T")
	pass
func _not_correct(not_correct):
	$HUDPlayer/TextureProgress.value -=10
	
	pass
