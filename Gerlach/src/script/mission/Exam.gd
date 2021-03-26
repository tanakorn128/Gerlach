extends Node2D
var number
var number_index
var temp
var mission
export (Array) var exam
var ExamChapter1 = preload("res://src/script/Exam/Exam_All/Chapter1.tres")
var correct
var inst_enemy
export (int) var Time
func _ready():
	set_exam(ExamChapter1.ExamAll.size())
	import_exam()
	var audio = $AudioCorrect.stream as  AudioStreamOGGVorbis
	audio.set_loop(false)
	audio = $AudioWrong.stream as  AudioStreamOGGVorbis
	audio.set_loop(false)
	audio = $click.stream as  AudioStreamOGGVorbis
	audio.set_loop(false)
	enemy()
func set_exam(size): #นำเข้าข้อสอบจากภายนอก
	for i in size:
		exam.append(ExamChapter1.ExamAll[i])


func get_Exam_Chapter(chapter): #นำเข้าข้อสอบจากภายนอก
	if chapter == 1:
		return exam


func _on_answer1_button_down():
	_answer($answer1/Label.text,correct)
	pass # Replace with function body.


func _on_answer2_button_down():
	_answer($answer2/Label.text,correct)
	pass # Replace with function body.


func _on_answer3_button_down():
	_answer($answer3/Label.text,correct)
	pass # Replace with function body.


func _on_answer4_button_down():
	_answer($answer4/Label.text,correct)
	pass # Replace with function body.

func random_exam(value): #สุ่มตัวเลข
	var temp_rng
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var my_random_number : int = rng.randf_range(1, value)
	number = my_random_number
	if temp == number:
		number+2
	temp = number
	return my_random_number

func _show(question,answer1,answer2,answer3,answer4):
	$"Label question".text = str(question)
	$answer1/Label.text = str(answer1)
	$answer2/Label.text = str(answer2)
	$answer3/Label.text = str(answer3)
	$answer4/Label.text = str(answer4)

func record_reply(question,correct,answer1,answer2,answer3,answer4):
	$"/root/Global".question.append(question)
	$"/root/Global".Ans.append(str("ก)",answer1,"     ข)",answer2,"     ค)",answer3,"     ง)",answer4))
	$"/root/Global".correct.append(correct)

func _answer(correct,answer): #ตรวจคำตอบ
	if correct == answer: #ตอบถูก
		hp_enemy(-20)
		$AudioCorrect.playing = true
		import_exam()
		return true
	else:#ตอบผิด
		attack("enemy")
		hp_player(-20)
		$AudioWrong.playing = true
		import_exam()
		return false

func import_exam(): # เลือก Chapter ของข้อสอบ
	var importexam = get_Exam_Chapter(1)
	var rng = random_exam(importexam.size()-1)
	record_reply(importexam[rng].Question,importexam[rng].Correct,importexam[rng].answer1,
	importexam[rng].answer2,importexam[rng].answer3,importexam[rng].answer4)
	_show(importexam[rng].Question,importexam[rng].answer1,importexam[rng].answer2,importexam[rng].answer3,importexam[rng].answer4)
	correct = importexam[rng].Correct
	$TextureProgress.value = Time

func finish(value:String,hp:int): #player or Enemy
	if value == "player" && hp <= 0:
		get_tree().change_scene("res://src/scene/Answer.tscn")
		#$"/root/Scene".scene($"/root/Global".scene)
	elif value == "enemy" && hp <= 0:
		$"/root/MissionInventory".set_value($"/root/Global".scene,$"/root/Global".number_index,"finish",true)
		#$"/root/Scene".scene($"/root/Global".scene)
		get_tree().change_scene("res://src/scene/Answer.tscn")


func _on_Timer_timeout():#จับเวลา
	if $TextureProgress.value > 0:
		$TextureProgress.value -= 1
	else:
		$TextureProgress.value = Time
		hp_player(-20)
		import_exam()
	pass # Replace with function body.

func hp_player(value:int):
	$player.hp(value)
	finish("player",$player.get_hp())

func hp_enemy(value:int):
	inst_enemy.hp(value)
	finish("enemy",inst_enemy.get_hp())


func _on_answer1_mouse_entered():
	$click.play()
	pass # Replace with function body.


func _on_answer2_mouse_entered():
	$click.play()
	pass # Replace with function body.


func _on_answer3_mouse_entered():
	$click.play()
	pass # Replace with function body.


func _on_answer4_mouse_entered():
	$click.play()
	pass # Replace with function body.

func enemy():
	inst_enemy = $"/root/Scene".Enemy($"/root/Global".enemy)
	inst_enemy.position = Vector2(232.06,159.184)
	add_child(inst_enemy)

func attack(value:String):#player and enemy
	if value == "enemy":
		inst_enemy.attack()
