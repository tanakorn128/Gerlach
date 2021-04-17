extends Node2D

func _on_7_4_body_entered(body):
	if body.get_name() == "player":
		$"/root/MissionInventory"._save_player.position = Vector2(98.605,4593.452)
		$"/root/Scene".scene(14)
		$"/root/Global".chapter = "chapter7"
	pass # Replace with function body.

