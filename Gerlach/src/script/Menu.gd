extends Control

func _ready():
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	#print(save_nodes.size())
	pass

func _on_start_button_down():
	get_tree().change_scene("res://src/scene/chapter1.tscn")
	pass # Replace with function body.


func _on_EXIT_GAME_button_down():
	get_tree().quit()
	pass # Replace with function body.
