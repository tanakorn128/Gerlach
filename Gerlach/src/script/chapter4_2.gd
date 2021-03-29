extends Node2D




func _on_chapter6_body_entered(body):
	if body.get_name() == "player":
		$"/root/Scene".scene(6)
	pass # Replace with function body.


func _on_chapter5_2_body_entered(body):
	if body.get_name() == "player":
		$"/root/Scene".scene(5.2)
	pass # Replace with function body.
