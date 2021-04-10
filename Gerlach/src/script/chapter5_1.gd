extends Node2D


func _on_Chapter5_2__body_entered(body):
	if body.get_name() == "player":
		$"/root/Scene".scene(8)
	pass # Replace with function body.
