extends Node2D
export (bool) var test

func _ready():
	if test && not $"/root/Global".test:
		$"/root/Global".player_pos = Vector2(7376.69,-1458.58)
		$"/root/Global".test = true
	else:
		$player.position = $"/root/MissionInventory"._save_player.position

func _on_7_6_body_entered(body):
	if body.get_name() == "player":
		$"/root/MissionInventory"._save_player.position = Vector2(5095.26,-1338.48)
		$"/root/Scene".scene(16)
	pass # Replace with function body.
