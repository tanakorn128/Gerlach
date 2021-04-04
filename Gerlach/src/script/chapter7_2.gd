extends Node2D
func _ready():
	$"/root/Global"._Exam = 3
	lable("chapter7_2_dialogbox1")

func lable(value:String):
	$"/root/Global"._dialogbox = value
	if $dialogbox._dialogbox(true):
		$"/root/Global".player_pos = $player.position
		$dialogbox.show()
		$dialogbox.position.x = $player.position.x -660
		$dialogbox.position.y = $player.position.y + 120
		$dialogbox._dialogbox(true)


func _on_Area2D_body_entered(body):
	if body.get_name() == "player":
		$"/root/Scene".scene(13)
	pass # Replace with function body.
