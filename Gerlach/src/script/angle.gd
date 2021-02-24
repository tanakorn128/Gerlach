extends Node2D
var zone1 = false
var zone2 = false
var zone3 = false
var zone4 = false
var NotCorrect = true
var Corret = true
var answer:Array
var card:Array
var card1 = true
var card2 = true
var card3 = true
var card4 = true
var resource = preload("res://src/script/Exam/Exam_All/Angle.tres")
func _ready():
	set_question()
	
	$AnimationPlayer.play("idle")
	


func set_question():
	var angle1 = resource.ExamAll[0].angle
	var image1 = resource.ExamAll[0].image
	var text1 = resource.ExamAll[0].text
	var angle2 = resource.ExamAll[1].angle
	var image2 = resource.ExamAll[1].image
	var text2 = resource.ExamAll[1].text
	var question1
	var question2
	var question3
	var question4
	var rnd = random()
	if rnd == 1:
		$answer1_front/answer1.texture = image1
		$answer2_front/answer2.texture = angle1
		$answer3_front/answer3.texture = image2
		$answer4_front/answer4.texture = angle2
		question1 = text1
		question2 = text1
		question3 = text2
		question4 = text2
		set_answer(question1,question2,question3,question4)
	elif rnd == 2:
		$answer1_front/answer1.texture = image1
		$answer2_front/answer2.texture = image2
		$answer3_front/answer3.texture = angle1
		$answer4_front/answer4.texture = angle2
		question1 = text1
		question2 = text2
		question3 = text1
		question4 = text2
		set_answer(question1,question2,question3,question4)
	elif rnd == 3:
		$answer1_front/answer1.texture = image2
		$answer2_front/answer2.texture = image1
		$answer3_front/answer3.texture = angle2
		$answer4_front/answer4.texture = angle1
		question1 = text2
		question2 = text1
		question3 = text2
		question4 = text1
		set_answer(question1,question2,question3,question4)
	elif rnd == 4:
		$answer1_front/answer1.texture = image2
		$answer2_front/answer2.texture = image1
		$answer3_front/answer3.texture = angle1
		$answer4_front/answer4.texture = angle2
		question1 = text2
		question2 = text1
		question3 = text1
		question4 = text2
		set_answer(question1,question2,question3,question4)
	pass

func random():
	return 4
	pass

func _process(delta):
	if card.size() == 4:
		answer(card[0],card[1],card[2],card[3])


func cards():
	$card.start()
	pass
func show():
	$Timer.start()
	pass

func answer(image,numcard1,angle,numcard2):
	if image == angle:
		if numcard1 == 1:
			card1 = false
		if numcard1 == 2:
			card2 = false
		if numcard1 == 3:
			card3 = false
		if numcard1 == 4:
			card4 = false
		
		if numcard2 == 1:
			card1 = false
		if numcard2 == 2:
			card2 = false
		if numcard2 == 3:
			card3 = false
		if numcard2 == 4:
			card4 = false
		$Correct.playing = true
		print("Corret")
		$AnimationPlayer.play("correct")
		card.clear()
		$card.start()
		$battle._Correct(51)
		return true
	elif NotCorrect:
		print("NotCorrect")
		show()
		$Wrong.playing = true
		NotCorrect = false
		$AnimationPlayer.play("NotCorrect")
		$card.start()
		$battle._not_correct(51)
		return false
	pass
func click():
	if card1:
		$answer1_front/TextureRect.show()
	if card2:
		$answer2_front/TextureRect.show()
	if card3:
		$answer3_front/TextureRect.show()
	if card4:
		$answer4_front/TextureRect.show()
	pass
func _input(event):
	if event is InputEventMouseButton:
		if event.doubleclick:
			click()
			print("doubleclick")
	if event.is_action_pressed("mouse left"):
		if zone1:
			$answer1_front/TextureRect.hide()
			card.append(answer[0])
			card.append(1)
			cards()
			pass
		if zone2:
			$answer2_front/TextureRect.hide()
			card.append(answer[1])
			card.append(2)
			cards()
			pass
		if zone3:
			$answer3_front/TextureRect.hide()
			card.append(answer[2])
			card.append(3)
			cards()
			pass
		if zone4:
			$answer4_front/TextureRect.hide()
			card.append(answer[3])
			card.append(4)
			cards()
			pass
		pass

func set_answer(value1,value2,value3,value4):
	answer.append(value1)
	answer.append(value2)
	answer.append(value3)
	answer.append(value4)
	pass




func _on_ReferenceAnswer1_mouse_entered():
	zone1 = true
	$AnimationPlayer.play("card1_open")
	pass # Replace with function body.


func _on_ReferenceAnswer2_mouse_entered():
	zone2 = true
	$AnimationPlayer.play("card2_open")
	
	pass # Replace with function body.


func _on_ReferenceAnswer3_mouse_entered():
	$AnimationPlayer.play("card3_open")
	zone3 = true
	
	pass # Replace with function body.


func _on_ReferenceAnswer4_mouse_entered():
	$AnimationPlayer.play("card4_open")
	zone4 = true
	pass # Replace with function body.


func _on_ReferenceAnswer1_mouse_exited():
	zone1 = false
	$AnimationPlayer.play("idle")
	pass # Replace with function body.


func _on_ReferenceAnswer2_mouse_exited():
	zone2 = false
	$AnimationPlayer.play("idle")
	pass # Replace with function body.


func _on_ReferenceAnswer3_mouse_exited():
	zone3 = false
	$AnimationPlayer.play("idle")
	pass # Replace with function body.


func _on_ReferenceAnswer4_mouse_exited():
	zone4 = false
	$AnimationPlayer.play("idle")
	pass # Replace with function body.


func _on_Timer_timeout():
	$answer1_front/TextureRect.show()
	$answer2_front/TextureRect.show()
	$answer3_front/TextureRect.show()
	$answer4_front/TextureRect.show()
	card.clear()
	NotCorrect = true
	$Timer.stop()
	pass # Replace with function body.


func _on_card_timeout():
	click()
	card.clear()
	$AnimationPlayer.play("idle")
	$card.stop()
	pass # Replace with function body.
