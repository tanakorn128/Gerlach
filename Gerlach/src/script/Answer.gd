extends Node2D
var topic = ") "
var back:bool = false
func _ready():
	for i in $"/root/Global".Ans.size():
		$question.add_item(str(i+1,") ",$"/root/Global".question[i]),null,false)
		#$question.add_item($"/root/Global".Ans[i],null,false)
		$question.add_item(str("ตอบ ",$"/root/Global".correct[i]),null,false)
		$question.add_item(str(" "),null,false)


func _on_Button_button_down():
	$"/root/Global".question.clear()
	$"/root/Global".Ans.clear()
	$"/root/Global".correct.clear()
	$"/root/Scene".scene($"/root/Global".scene)
	pass # Replace with function body.

func _on_back_button_down():
	$"/root/Global".question.clear()
	$"/root/Global".Ans.clear()
	$"/root/Global".correct.clear()
	get_tree().change_scene("res://src/scene/profile.tscn")
	pass # Replace with function body.
