extends Node2D



func _on_chapter6_1_body_entered(body):
	if body.get_name() == "player":
		$"/root/Scene".scene(9)
	pass # Replace with function body.
