extends Node2D
export (bool) var test

func _ready():
	if test && not $"/root/Global".test:
		$"/root/Global".player_pos = Vector2(-9758.69,-353.975)
		$"/root/Global".test = true
	else:
		$player.position = $"/root/MissionInventory"._save_player.position
	

func _on_7_4_body_entered(body):
	if body.get_name() == "player":
		$"/root/Scene".scene(14)
	pass # Replace with function body.

func lable(value:String):
	$"/root/Global"._dialogbox = value
	if $dialogbox._dialogbox(true):
		$"/root/Global".player_pos = $player.position
		$dialogbox.show()
		$dialogbox.position.x = $player.position.x -660
		$dialogbox.position.y = $player.position.y + 120
		$dialogbox._dialogbox(true)
