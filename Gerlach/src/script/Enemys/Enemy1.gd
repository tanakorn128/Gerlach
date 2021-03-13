extends Node2D
var Trash1 = false  #Event Mouse Zone ถังขยะ
var Trash2 = false  #Event Mouse Zone ถังขยะ
var Trash3 = false  #Event Mouse Zone ถังขยะ
var EventTrash1 = true #Event  ขยับถังขยะตาม Mouse
var EventTrash2 = true #Event  ขยับถังขยะตาม Mouse
var EventTrash3 = true #Event  ขยับถังขยะตาม Mouse
var correct_Trash1 #คำตอบTrash1 
var correct_Trash2 #คำตอบTrash2
var correct_Trash3 #คำตอบTrash3
var ResetPosition = false
var dic_exam
func _ready():
	dic_exam = $"/root/Global".dic_Correct_Chapter1
	$Trash1/AnimationPlayer.play("swipe")
	$Trash2/AnimationPlayer.play("swipe")
	$Trash3/AnimationPlayer.play("swipe")
	$Trash3/AnimationPlayer_down.play("swipe")
	$Trash2/AnimationPlayer_down2.play("swipe")
	$Trash1/AnimationPlayer_down3.play("swipe")
	SetQuestion()
	$Trash1/ReferenceRect1.show()
	$Trash2/ReferenceRect2.show()
	$Trash3/ReferenceRect3.show()
	dic_exam["Type"] = "ปัดเศษ"
	dic_exam["chapter"] = str(get_node("/root/Global").scene)
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
	#correct_Trash1 = "down" #คำตอบTrash1 
	#correct_Trash2 = "up"  #คำตอบTrash2
	#correct_Trash3 = "down"  #คำตอบTrash3
	pass

func correct(): #คำตอบถูก
	$battle._Correct(40)
	$AudioCorrect.playing = true
	#print("T")
	pass

func not_correct(): #ตอบผิด
	$battle._not_correct(40)
	$AudioWrong.playing = true
	ResetPosition = true
	$Timer.start()
	#print("F")
	pass

func RandomNumber():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var my_random_number = rng.randf_range(0, 9)
	return int(my_random_number)


func reset():
	var T1_Position = Vector2(430.052,503.016)
	var T2_Position = Vector2(678.098,503.016)
	var T3_Position = Vector2(678.098,503.016)
	$Trash1.position.y = T1_Position.y
	$Trash2.position.y = T2_Position.y
	$Trash3.position.y = T3_Position.y
	var Trash1 = false 
	Trash2 = false 
	Trash3 = false 
	EventTrash1 = true #Event
	EventTrash2 = true #Event
	EventTrash3 = true #Event
	$Trash1/TextureRect.show()
	$Trash1/TextureRect_down3.show()
	$Trash2/TextureRect.show()
	$Trash2/TextureRect_down2.show()
	$Trash3/TextureRect.show()
	$Trash3/TextureRect_down.show()
	
func SetQuestion():
	var valueTrash1_1 =  RandomNumber()
	var valueTrash1_2 =  RandomNumber()
	var valueTrash2_1 =  RandomNumber()
	var valueTrash2_2 =  RandomNumber()
	var valueTrash3_1 =  RandomNumber()
	var valueTrash3_2 =  RandomNumber()
	$Trash1/Label.text = str(valueTrash1_1,".",valueTrash1_2)
	$Trash2/Label.text = str(valueTrash2_1,".",valueTrash2_2)
	$Trash3/Label.text = str(valueTrash3_1,".",valueTrash3_2)
	if valueTrash1_2 >= 5:
		correct_Trash1 = "up"
	else: 
		correct_Trash1 = "down"
	if valueTrash2_2 >= 5:
		correct_Trash2 = "up"
	else: 
		correct_Trash2 = "down"
	if valueTrash3_2 >= 5:
		correct_Trash3 = "up"
	else: 
		correct_Trash3 = "down"


func _on_Timer_timeout():
	if ResetPosition:
		reset()
		SetQuestion()
		ResetPosition = false
	pass # Replace with function body.
