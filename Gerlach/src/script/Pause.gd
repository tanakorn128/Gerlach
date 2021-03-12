extends Node2D
var state = false
func _ready():
	hide()
	pass

func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		state = !state
	if state:
		show()
		pass
	else:
		hide()
		pass
	pass


func _on_Exit_button_down():
	get_tree().quit()
	pass # Replace with function body.


func _on_Score_button_down():
	get_tree().change_scene("res://src/scene/Overview.tscn")
	pass # Replace with function body.
