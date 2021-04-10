extends Node2D


func _on_7_4_body_entered(body):
	if body.get_name() == "player":
		$"/root/Scene".scene(14)
	pass # Replace with function body.
