extends Node2D
var number_index:int
var type_enemy:int
var area:bool = false

func _ready():
	$Timer.start()
	
func _on_Area2D_body_entered(body):
	if body.get_name() == "player" && area:
		Events.emit_signal("Enemy_pos",position)
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


func _on_Timer_timeout():
	area = true
	$Timer.stop()
	pass # Replace with function body.
