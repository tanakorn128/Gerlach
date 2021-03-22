extends Node2D
var number
var type_enemy:int
func _on_Area2D_body_entered(body):
	if body.get_name() == "player":
		Type(type_enemy)
	pass # Replace with function body.

func Type(value:int):
	if value == 0:
		get_tree().change_scene("res://src/scene/EnemyType/Rounding_number.tscn")
	if value == 1:
		get_tree().change_scene("res://src/scene/EnemyType/Sort.tscn")

func hp(value:int):
	$HUD/TextureProgress.value += value
