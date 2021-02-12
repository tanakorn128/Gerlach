extends Node2D
var Text:Array
var end = false
var LableEnd = false
var count = 0
func _ready():
	#get_text(0)
	$AnimationPlayer.play("idle")
	$"/root/Menu".hide()
	Events.connect("player_position",self,"player_position")

func player_position(position):
	self.position.x = position.x -670
	self.position.y = position.y + 50
	pass
func _input(event):
	if event.is_action_pressed("ui_select") && end && count < Text.size()-1:
		count += 1
		get_text(count)
	elif event.is_action_pressed("ui_select") && LableEnd:
		queue_free()
	pass

func set_text(value):
	Text.append(str(value))
	return Text
	pass

func get_text(value):
	$AnimationPlayer.play("idle")
	$Label.text = Text[value]
	pass

func _on_AnimationPlayer_animation_finished(anim_name):
	end = true
	if count == Text.size()-1:
		LableEnd = true
	pass # Replace with function body.


