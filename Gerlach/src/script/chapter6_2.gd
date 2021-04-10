extends Node2D


func _on_6_3_body_exited(body):
	if body.get_name() == "player":
		$"/root/Scene".scene(11)
	pass # Replace with function body.
