extends Node2D
var exam = preload("res://src/script/Exam/Exam_All/Sort.tres")
var answer:Array
var Num_min = 0
var num3 = null
var num4 = null
var Num_max = 0 
var stage = 0


#เรียงจากน้อยไปมาก
var number1
var number2
var number3
var number4
var random:Array
var time = int(60)
func _ready():
	set_answer()
	$Timer.start()
	$AnimationPlayer.play("idle")
	pass

func _process(delta):
	if $battle/HUDEnemy/TextureProgress.value <= 0:
		$Timer.stop()
		$Label.hide()
	pass
func set_answer():
	var rnd = RandomNumber()
	#print(exam.ExamAll[1].answer1)
	#get_answer(2,6,10,2)
	get_answer(
	exam.ExamAll[rnd].answer1,
	exam.ExamAll[rnd].answer2,
	exam.ExamAll[rnd].answer3,
	exam.ExamAll[rnd].answer4)
	time = 60
	$Button1.disabled = false
	$Button2.disabled = false
	$Button3.disabled = false
	$Button4.disabled = false


func get_answer (answer0,answer1,answer2,answer3):
	answer.append(answer0)
	answer.append(answer1)
	answer.append(answer2)
	answer.append(answer3)
	#########################################################################
	#########################################################################
	for i in answer.size():
		if answer[Num_min] < answer[i]:
			pass
		else:
			Num_min = i #min
		if answer[Num_max] > answer[i]:
			pass
		else:
			Num_max = i #max
		
	number1 = answer[Num_min]
	number4 = answer[Num_max]
	answer[Num_min] = null
	answer[Num_max] = null
	
	for i in answer.size():
		if answer[i] != null:
			num3 = i
	number3 = answer[num3]
	answer[num3] = null
	
	for i in answer.size():
		if answer[i] != null:
			num4  = i
	number2 = answer[num4]
	answer[num4] = null
	
	if number2 > number3:
		var temp
		temp = number3
		number3 = number2
		number2 = temp
#########################################################################
#########################################################################
	
	
	answer[0] = answer0
	answer[1] = answer1
	answer[2] = answer2
	answer[3] = answer3
	
	$Button1.text = str(answer[0])
	$Button2.text = str(answer[1])
	$Button3.text = str(answer[2])
	$Button4.text = str(answer[3])
	

func Check_answer(index,stages):
	if stages == 0:
		if number1 == answer[index]:
			correct()
		else:
			not_correct()
	if stages == 1:
		if number2 == answer[index]:
			correct()
		else:
			not_correct()
	if stages == 2:
		if number3 == answer[index]:
			correct()
		else:
			not_correct()
	if stages == 3:
		if number4 == answer[index]:
			$correct.playing = true
			correct()
			$battle._Correct(100)
			remove_Setting()
			set_answer()
		else:
			not_correct()
			
	pass
 
func correct():
	stage += 1
	pass
func remove_Setting():
	answer.clear()
	Num_min = 0
	num3 = null
	num4 = null
	Num_max = 0 
	stage = 0
	
func not_correct():
	$wrong.playing = true
	remove_Setting()
	set_answer()
	$battle._not_correct(20)
	pass





func RandomNumber():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var my_random_number = rng.randf_range(1, exam.ExamAll.size()-1)
	return int(my_random_number)


func _on_Button1_button_down():
	$Button1.disabled = true
	Check_answer(0,stage)
	$Click.playing = true
	pass # Replace with function body.



func _on_Button2_button_down():
	$Button2.disabled = true
	Check_answer(1,stage)
	$Click.playing = true
	pass # Replace with function body.


func _on_Button3_button_down():
	$Button3.disabled = true
	Check_answer(2,stage)
	$Click.playing = true
	pass # Replace with function body.


func _on_Button4_button_down():
	$Button4.disabled = true
	Check_answer(3,stage)
	$Click.playing = true
	pass # Replace with function body.


func _on_Timer_timeout():
	$Label.text = str(time)
	if (time <= 0):
		not_correct()
		$wrong.playing = true
	time -= 1
	
	pass # Replace with function body.


