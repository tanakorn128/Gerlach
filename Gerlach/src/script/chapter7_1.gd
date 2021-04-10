extends Node2D


func _on_7_2_body_entered(body):
	if body.get_name() == "player":
		$"/root/Scene".scene(12)
	pass # Replace with function body.
