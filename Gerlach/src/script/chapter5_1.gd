extends Node2D
func _ready():
	$"/root/Global"._Exam = 3


func _on_Area2D_body_entered(body):
	$"/root/Scene".scene(7)
	pass # Replace with function body.
