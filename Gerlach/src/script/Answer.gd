extends Node2D
var topic = ") "
func _ready():
	for i in $"/root/Global".Ans.size():
		$question.add_item(str(i+1,") ",$"/root/Global".question[i]),null,false)
		$question.add_item($"/root/Global".Ans[i],null,false)
		$question.add_item(str("ตอบ ",$"/root/Global".correct[i]),null,false)
		$question.add_item(str(" "),null,false)
		


func _on_Button_button_down():
	$"/root/Scene".scene($"/root/Global".scene)
	pass # Replace with function body.
