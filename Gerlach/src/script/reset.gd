extends Node2D
var _save = load("user://dialogbox/dialogbox.tres")


func _on_Button_button_down():
	for i in _save.save.size():
		_save.save[i] = false
		ResourceSaver.save("user://dialogbox/dialogbox.tres",_save)
	pass # Replace with function body.
