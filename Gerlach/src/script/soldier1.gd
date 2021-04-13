extends Node2D
#ไว้สำหรับพูดคุย
var number_index:int
var type_enemy:int
var _dialogbox:String
var text:String = "หทาร"
var pos:Vector2



func lable(value:String):
	$"/root/Global"._dialogbox = value
	if $dialogbox._dialogbox(true):
		$dialogbox.show()
		$dialogbox.position.x = -get_viewport_rect().size.x/2
		$dialogbox.position.y = -get_viewport_rect().size.y/13
		$dialogbox._dialogbox(true)
	

func _on_Area2D_body_entered(body):
	if body.get_name() == "player":
		lable(_dialogbox)
		#$"/root/Global".enemy = "soldler1"
		#$"/root/Global".number_index = number_index
		#$"/root/Scene".Type(type_enemy)
	pass # Replace with function body.


func _on_label_body_entered(body):
	$Label.text = text
	$Label.show()
	pass # Replace with function body.


func _on_Area_label_body_exited(body):
	$Label.hide()
	pass # Replace with function body.
