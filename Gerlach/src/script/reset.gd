extends Node2D
var _save_dialogbox = load("user://dialogbox/dialogbox.tres")
var _save_mission = load("user://mission/mission.tres")


func _on_Button_button_down():
	for i in _save_dialogbox.save.size():
		_save_dialogbox.save[i] = false
		ResourceSaver.save("user://dialogbox/dialogbox.tres",_save_dialogbox)
	for i in _save_mission.save.size():
		_save_mission.save[i] = false
		ResourceSaver.save("user://mission/mission.tres",_save_mission)
	pass # Replace with function body.
