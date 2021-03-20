extends Node2D
var number


func _on_Area2D_body_entered(body):
	if body.get_name() == "player":
		print(number)
	pass # Replace with function body.
