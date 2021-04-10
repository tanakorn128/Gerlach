extends Node2D



func _on_next_chapter_body_entered(body):
	if body.get_name() == "player":
		$"/root/Scene".scene(15)
	pass # Replace with function body.
