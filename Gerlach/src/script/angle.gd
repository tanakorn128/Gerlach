extends Node2D
var answer1_back:Array
var answer1:Array
var answer2:Array
var zone1 = false
var zone2 = false
var zone3 = false
var zone4 = false

func _ready():
	set_answer(1,2,3,4)
	$answer1.hide()
	$answer2.hide()
	$answer3.hide()
	$answer4.hide()
func _input(event):
	if event.is_action_pressed("mouse left"):
		if zone1:
			answer1_back.append(1)
			$answer1_front/TextureRect.hide()
			$answer1.show()
			answer()
			pass
		if zone2:
			answer1_back.append(2)
			$answer2_front/TextureRect.hide()
			$answer2.show()
			answer()
			pass
		if zone3:
			answer1_back.append(3)
			$answer3_front/TextureRect.hide()
			$answer3.show()
			answer()
			pass
			
		if zone4:
			answer1_back.append(4)
			$answer4_front/TextureRect.hide()
			$answer4.show()
			answer()
		pass

func set_answer(value1,value2,value3,value4):
	answer1.append(value1)
	answer1.append(value2)
	answer2.append(value3)
	answer2.append(value4)



func answer():
	if answer1_back.size() == 2:
		$Timer.start()
		pass
	elif answer1_back.size() >= 2:
		$Timer.start()
	
	pass
func _on_ReferenceAnswer1_mouse_entered():
	zone1 = true
	pass # Replace with function body.


func _on_ReferenceAnswer2_mouse_entered():
	zone2 = true
	pass # Replace with function body.


func _on_ReferenceAnswer3_mouse_entered():
	zone3 = true
	pass # Replace with function body.


func _on_ReferenceAnswer4_mouse_entered():
	zone4 = true
	pass # Replace with function body.


func _on_ReferenceAnswer1_mouse_exited():
	zone1 = false
	pass # Replace with function body.


func _on_ReferenceAnswer2_mouse_exited():
	zone2 = false
	pass # Replace with function body.


func _on_ReferenceAnswer3_mouse_exited():
	zone3 = false
	pass # Replace with function body.


func _on_ReferenceAnswer4_mouse_exited():
	zone4 = false
	pass # Replace with function body.


func _on_Timer_timeout():
	$battle._not_correct(20)
	answer1_back.clear()
	$answer1_front/TextureRect.show()
	$answer2_front/TextureRect.show()
	$answer3_front/TextureRect.show()
	$answer4_front/TextureRect.show()
	$answer1.hide()
	$answer2.hide()
	$answer3.hide()
	$answer4.hide()
	pass # Replace with function body.
