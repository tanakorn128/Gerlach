extends Node2D



func _on_chapter4_2_body_entered(body):
	if body.get_name() == "player":
		$"/root/Scene".scene(4.2)
	pass # Replace with function body.


func _on_chapter3_2_body_entered(body):
	if body.get_name() == "player":
		$"/root/Scene".scene(3.2)
	pass # Replace with function body.
