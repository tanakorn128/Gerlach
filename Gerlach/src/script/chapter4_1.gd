extends Node2D
func _ready():
	$"/root/Global"._Exam = 2
	$"/root/Global".chapter = "chapter4"
	lable("chapter4_1_dialogbox1")
	pass

func _on_chapter4_2_body_entered(body):
	if body.get_name() == "player":
		$"/root/MissionInventory"._save_player.position = Vector2(2503.74,807.724)
		$"/root/Scene".scene(6)
	pass # Replace with function body.


func _on_chapter3_2_body_entered(body):
	if body.get_name() == "player":
		$"/root/Scene".scene(3.2)
	pass # Replace with function body.

func lable(value:String):
	$"/root/Global"._dialogbox = value
	if $dialogbox._dialogbox(true):
		$"/root/Global".player_pos = $player.position
		$dialogbox.show()
		$dialogbox.position.x = $player.position.x -950
		$dialogbox.position.y = $player.position.y + 120
		$dialogbox._dialogbox(true)
