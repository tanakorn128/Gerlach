extends Node2D
export (bool) var test

func _ready():
	if test && not $"/root/Global".test:
		$"/root/Global".player_pos = Vector2(-850.795,-2421.43)
		$"/root/Global".test = true
	else:
		$player.position = $"/root/MissionInventory"._save_player.position
	$"/root/Global".scene = 9
	$"/root/Global".chapter = "chapter6"
	lable("chapter6_1_DB1")
	

func _process(delta):
	$"/root/MissionInventory"._save_player.position = $player.position

func _on_Area2D_body_entered(body):
	if body.get_name() == "player":
		$"/root/MissionInventory"._save_player.position = Vector2(4436.206,-2809.88)
		$"/root/Scene".scene(10)
	pass # Replace with function body.

func lable(value:String):
	$"/root/Global"._dialogbox = value
	if $dialogbox._dialogbox(true):
		$"/root/Global".player_pos = $player.position
		$dialogbox.show()
		$dialogbox.position.x = $player.position.x -660
		$dialogbox.position.y = $player.position.y + 120
		$dialogbox._dialogbox(true)
