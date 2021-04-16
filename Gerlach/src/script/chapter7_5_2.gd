extends Node2D



func _on_8_body_entered(body):
	if body.get_name() == "player":
		$"/root/MissionInventory"._save_player.position = Vector2(-11.914,604.567)
		$"/root/Scene".scene(17)
	pass # Replace with function body.
