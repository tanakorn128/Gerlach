extends Node2D
var all
var Text:Array
var end = false
var count = 0
var arr_size
var state = false
var save:bool = false
var finished:bool = false
var _changescene:bool = false
var scene:int
var _save2
var id


func _ready():
	all = $"/root/MissionInventory"._dialogbox
	_save2 = $"/root/MissionInventory"._save_dialogbox
	#get_node("/root/Scene").scene(get_node("/root/Global").scene)

func _dialogbox(_save:bool):
	id = all.all[$"/root/Global"._dialogbox].id
	save = _save
	if not _save2.save[id]:
		show()
		$ColorRect.show()
		$Label.show()
		$"/root/Global".playerwalk = false
		set_text($"/root/Global"._dialogbox)
		finished = false
		return true
	return false
func _input(event):
	if event.is_action_pressed("ui_select") && state:
		if count < arr_size-1:
			count += 1
			#print(all.all[$"/root/Global"._dialogbox].finish)
			Events.emit_signal("count_dialogbox",count)
		else:
			if save:
				_save2.save[id] = true
				#ResourceSaver.save("user://dialogbox/dialogbox.tres",_save2)
			hide()
			$ColorRect.hide()
			$Label.hide()
			#queue_free()
			state = false
			$"/root/Global".playerwalk = true
			changescene()
			finished = true
		get_text(count)


func set_text(value:String):
	state = true
	arr_size = all.all[value].dialogbox.size()
	for i in arr_size:
		Text.append(all.all[value].dialogbox[i])
	get_text(count)


func get_text(value):
	$AnimationPlayer.play("idle")
	$Label.text = Text[value]


func clear_text():
	Text.clear()

func changescene():
	if not _changescene:
		$"/root/Scene".scene($"/root/Global".scene)
	else:
		$"/root/Global".scene = scene

