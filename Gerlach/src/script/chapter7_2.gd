extends Node2D


func _on_7_3_body_entered(body):
	if body.get_name() == "player":
		$"/root/Scene".scene(13)
	pass # Replace with function body.
