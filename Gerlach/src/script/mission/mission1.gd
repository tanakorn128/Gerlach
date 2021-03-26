extends Node2D
var number_index:int
var type_enemy:int
func _on_Area2D_body_entered(body):
	if body.get_name() == "player":
		$"/root/Global".enemy = "tree"
		$"/root/Global".number_index = number_index
		$"/root/Scene".Type(type_enemy)
	pass # Replace with function body.


func hp(value:int):
	$HUD/TextureProgress.value += value

func get_hp():
	return $HUD/TextureProgress.value

func attack():
	$AnimationPlayer.play("attack1")
	pass
