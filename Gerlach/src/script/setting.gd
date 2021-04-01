extends Node2D

export (Resource) var _dialogbox
#dialogbox
var key:Array
var size
func _ready():
	list()
	print(_dialogbox.all["chapter3_1 ป้ายบอกทาง 1"].finish)
func list():
	$fisinhed1.clear()
	var size = _dialogbox.all.size()
	for i in size:
		key.append(_dialogbox.all.keys()[i])
		$fisinhed1.add_item(str(key[i] , "                  ",check(key[i])),null,true)
		print(key[i])
func check(key:String):
	return _dialogbox.all[str(key)].finish

func reset():
	for i in key.size():
		_dialogbox.all[key[i]].finish = false
	print(_dialogbox.get_path())
	

func _on_reset_button_down():
	reset()
	ResourceSaver.save("res://src/scene/dialogbox/all.tres",_dialogbox)
	list()
	pass # Replace with function body.


func _on_save_button_down():
	reset()
	ResourceSaver.save("res://src/scene/dialogbox/all.tres",_dialogbox)
	list()
	
	pass # Replace with function body.
