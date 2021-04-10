extends Node2D


func _on_5_1_1_body_entered(body):
	if body.get_name() == "player":
		$"/root/Scene".scene(19)
	pass # Replace with function body.
