extends Node2D



func _on_8_body_entered(body):
	if body.get_name() == "player":
		$"/root/Scene".scene(17)
	pass # Replace with function body.
