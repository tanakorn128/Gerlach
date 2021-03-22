extends Node2D

func _on_Score_button_down():
	get_tree().change_scene("res://src/scene/Overview.tscn")
	pass # Replace with function body.


func _on_continue_button_down():
	if $"/root/Global".scene == 1:
		get_tree().change_scene("res://src/scene/chapter1.tscn")
	pass # Replace with function body.
