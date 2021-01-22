extends Node2D
var exam : Dictionary
var temp
func _ready():
	#print(random_exam())
	random_exam()
	pass

func _on_answer1_button_down():
	_answer(temp["Correct"],temp["answer1"])
	pass # Replace with function body.


func _on_answer2_button_down():
	_answer(temp["Correct"],temp["answer2"])
	pass # Replace with function body.


func _on_answer3_button_down():
	_answer(temp["Correct"],temp["answer3"])
	pass # Replace with function body.


func _on_answer4_button_down():
	_answer(temp["Correct"],temp["answer4"])
	pass # Replace with function body.
func random_exam():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var my_random_number : int = rng.randf_range(1, 5)
	var ex = exam()[str(my_random_number)]
	_show(ex["Question"],ex["answer1"],ex["answer2"],ex["answer3"],ex["answer4"])
	temp = ex
	return ex

func _show(question,answer1,answer2,answer3,answer4):
	$"Label question".text = str(question)
	$answer1/Label.text = str(answer1)
	$answer2/Label.text = str(answer2)
	$answer3/Label.text = str(answer3)
	$answer4/Label.text = str(answer4)
	pass
func _answer(correct,answer):
	
	if correct == answer:
		print("true")
		return true
	else:
		print("false")
		return false

func exam():
	exam = {
		"1":{
			"Question": "ข้อใดไม่ใช่จำนวนนับ",
			"pictures": " ",
			"answer1": "0",
			"answer2": "1",
			"answer3": "2",
			"answer4": "ไม่มีข้อถูก",
			"Correct": "0"
		},
		"2":{
			"Question": "ข้อใดเป็นจำนวนนับ",
			"pictures": " ",
			"answer1": "1",
			"answer2": "2",
			"answer3": "3",
			"answer4": "ถูกทุกข้อ",
			"Correct": "ถูกทุกข้อ"
		},
		"3":{
			"Question": "จำนวนนับในข้อใดน้อยที่สุด",
			"pictures": " ",
			"answer1": "0",
			"answer2": "1",
			"answer3": "2",
			"answer4": "3",
			"Correct": "1"
			},
		"4":{
			"Question": "จำนวนเต็มบวกข้อใดมีค่ามากที่สุด",
			"pictures": " ",
			"answer1": "0",
			"answer2": "1",
			"answer3": "2",
			"answer4": "3",
			"Correct": "3"
		},
		"5":{
			"Question": "จำนวนเต็มบวกข้อใดมีค่าน้อยที่สุด",
			"pictures": " ",
			"answer1": "0",
			"answer2": "1",
			"answer3": "2",
			"answer4": "3",
			"Correct": "1"
		}
	}
	return exam
	pass


func _on_Timer_timeout():
	if $TextureProgress.value > 0:
		$TextureProgress.value -= 1
	else:
		random_exam()
		$TextureProgress.value = 60
	pass # Replace with function body.
