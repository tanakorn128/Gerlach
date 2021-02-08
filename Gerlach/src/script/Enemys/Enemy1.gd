extends Node2D
var Trash1 = false 
var Trash2 = false 
var Trash3 = false 
var EventTrash1 = true #Event
var EventTrash2 = true #Event
var EventTrash3 = true #Event
var correct_Trash1 #คำตอบTrash1 
var correct_Trash2 #คำตอบTrash2
var correct_Trash3 #คำตอบTrash3
func _ready():
	$Trash1/AnimationPlayer.play("swipe")
	$Trash2/AnimationPlayer.play("swipe")
	$Trash3/AnimationPlayer.play("swipe")
	$Trash3/AnimationPlayer_down.play("swipe")
	$Trash2/AnimationPlayer_down2.play("swipe")
	$Trash1/AnimationPlayer_down3.play("swipe")
	set_question()
func _process(delta):
	pass # Replace with function body.





func _input(event):
	if Input.is_action_pressed("mouse left"):
		if Trash1 && EventTrash1:
			$Trash1.position.y = get_viewport().get_mouse_position().y
			if $Trash1.position.y <= 358:
				_hide(1)
				answer(1,"up")
			if $Trash1.position.y >= 612:
				_hide(1)
				answer(1,"down")
		if Trash2 && EventTrash2:
			$Trash2.position.y = get_viewport().get_mouse_position().y
			if $Trash2.position.y <= 358:
				_hide(2)
				answer(2,"up")
			if $Trash2.position.y >= 612:
				_hide(2)
				answer(2,"down")
		if Trash3 && EventTrash3:
			$Trash3.position.y = get_viewport().get_mouse_position().y
			if $Trash3.position.y <= 358:
				_hide(3)
				answer(3,"up")
			if $Trash3.position.y >= 612:
				_hide(3)
				answer(3,"down")
		pass
	pass



func _on_ReferenceRect1_mouse_entered():
	Trash1 = true
	pass # Replace with function body.


func _on_ReferenceRect1_mouse_exited():
	Trash1 = false
	pass # Replace with function body.


func _on_ReferenceRect2_mouse_entered():
	Trash2 = true
	pass # Replace with function body.


func _on_ReferenceRect2_mouse_exited():
	Trash2 = false
	pass # Replace with function body.


func _on_ReferenceRect3_mouse_entered():
	Trash3 = true
	pass # Replace with function body.


func _on_ReferenceRect3_mouse_exited():
	Trash3 = false
	pass # Replace with function body.

func _hide(value):
	if value == 1:
		$Trash1/TextureRect.hide()
		$Trash1/TextureRect_down3.hide()
		EventTrash1 = false
	if value == 2:
		$Trash2/TextureRect.hide()
		$Trash2/TextureRect_down2.hide()
		EventTrash2 = false
	if value == 3:
		$Trash3/TextureRect.hide()
		$Trash3/TextureRect_down.hide()
		EventTrash3 = false
	pass

func answer(trash,value):
	if trash == 1:
		if value == correct_Trash1:
			correct()
			return true
		else:
			not_correct()
			return false
	if trash == 2:
		if value == correct_Trash2:
			correct()
			return true
		else:
			not_correct()
			return false
	if trash == 3:
		if value == correct_Trash3:
			correct()
			return true
		else:
			not_correct()
			return false
	pass

func set_question():
	correct_Trash1 = "down" #คำตอบTrash1 
	correct_Trash2 = "up"  #คำตอบTrash2
	correct_Trash3 = "down"  #คำตอบTrash3

func correct(): #คำตอบถูก
	$battle._Correct(40)
	$AudioCorrect.playing = true
	print("T")
	pass

func not_correct(): #ตอบผิด
	$battle._not_correct(40)
	$AudioWrong.playing = true
	print("F")
	pass
