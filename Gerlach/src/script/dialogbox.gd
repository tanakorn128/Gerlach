extends Node2D
export (Resource) var all
var Text:Array
var end = false
var count = 0
var arr_size
var state = false
func _ready():
	pass
	#get_node("/root/Scene").scene(get_node("/root/Global").scene)

func _dialogbox():
	if not all.all[$"/root/Global"._dialogbox].finish:
		set_text($"/root/Global"._dialogbox)
		return true
	return false
func _input(event):
	if event.is_action_pressed("ui_select") && state:
		if count < arr_size-1:
			count += 1
		else:
			all.all[$"/root/Global"._dialogbox].finish = true
			ResourceSaver.save(all.all[$"/root/Global"._dialogbox].get_path(),all.all[$"/root/Global"._dialogbox])
			queue_free()
			state = false
			$"/root/Scene".scene($"/root/Global".scene)
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
