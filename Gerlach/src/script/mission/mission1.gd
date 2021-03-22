extends Node2D
var number_index:int
var type_enemy:int
func _on_Area2D_body_entered(body):
	if body.get_name() == "player":
		Type(type_enemy)
	pass # Replace with function body.

func Type(value:int):
	$"/root/Global".number_index = number_index
	if value == 0:
		get_tree().change_scene("res://src/scene/EnemyType/Rounding_number.tscn")
	if value == 1:
		get_tree().change_scene("res://src/scene/EnemyType/Sort.tscn")
	if value == 3:
		get_tree().change_scene("res://src/scene/EnemyType/Simple.tscn")

func hp(value:int):
	$HUD/TextureProgress.value += value
