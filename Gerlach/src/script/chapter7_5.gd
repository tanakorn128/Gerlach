extends Node2D



func _on_7_6_body_entered(body):
	if body.get_name() == "player":
		$"/root/Scene".scene(18)
	pass # Replace with function body.