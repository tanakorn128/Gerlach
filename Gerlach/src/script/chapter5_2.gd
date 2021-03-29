extends Node2D



func _on_chapter5_3_body_entered(body):
	if body.get_name() == "player":
		$"/root/Scene".scene(5.3)
	pass # Replace with function body.
