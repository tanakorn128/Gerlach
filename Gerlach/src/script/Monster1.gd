extends Node2D
var number_index:int
var type_enemy:int
var area:bool = false
func _ready():
	$HUD/TextureProgress.value = 100
	$Timer.start()
func _process(delta):
	if $HUD/TextureProgress.value <= 0:
		queue_free()
		get_tree().change_scene("res://src/scene/chapter2.tscn")

func hp(value:int):
	$HUD/TextureProgress.value += value

func get_hp():
	return $HUD/TextureProgress.value

func _on_Area2D_body_entered(body):
	if body.get_name() == "player" && area:
		$"/root/Global".enemy = "monster1"
		$"/root/Global".number_index = number_index
		$"/root/Scene".Type(type_enemy)
	pass # Replace with function body.

func attack():
	$AnimationPlayer.play("attack1")

func attack_finished():
	return true

func _on_AnimationPlayer_animation_finished(anim_name):
	attack_finished()
	pass # Replace with function body.




func _on_Timer_timeout():
	area = true
	$Timer.stop()
	pass # Replace with function body.
