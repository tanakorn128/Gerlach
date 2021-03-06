extends Node2D
var number
var number_index
var temp
var mission
export (Array) var exam
var correct
var inst_enemy
export (int) var Time
var playerhp
var check_button:bool = false
var a:Array
var question:String
var answer:String
func _ready():
	$"/root/Global".playerwalk = false
	#ข้อสอบ
	exam($"/root/Global"._Exam) #เลือกข่อสอบ
	random_exam()
	import_exam()
	
	##############
	var audio = $AudioCorrect.stream as  AudioStreamOGGVorbis
	audio.set_loop(false)
	audio = $AudioWrong.stream as  AudioStreamOGGVorbis
	audio.set_loop(false)
	audio = $click.stream as  AudioStreamOGGVorbis
	audio.set_loop(false)
	###############
	playerhp = $"/root/Player".player.hp
	$player/HUD/TextureProgress.value = 100
	
	enemy()



func _on_answer1_button_down():
	if not check_button:
		_answer($answer1/Label.text,correct)
	$answer1.disabled = true
	pass # Replace with function body.


func _on_answer2_button_down():
	if not check_button:
		_answer($answer2/Label.text,correct)
	$answer2.disabled = true
	pass # Replace with function body.


func _on_answer3_button_down():
	if not check_button:
		_answer($answer3/Label.text,correct)
	$answer3.disabled = true
	pass # Replace with function body.


func _on_answer4_button_down():
	if not check_button:
		_answer($answer4/Label.text,correct)
	$answer4.disabled = true
	pass # Replace with function body.

func random_exam(): #สุ่มตัวเลข
	for i in exam.size():
		a.append(i)
	randomize()
	a.shuffle()

func _show(question,answer1,answer2,answer3,answer4):
	$"Label question".text = str(question)
	$answer1/Label.text = str(answer1)
	$answer2/Label.text = str(answer2)
	$answer3/Label.text = str(answer3)
	$answer4/Label.text = str(answer4)

func record(question,correct,answer1,answer2,answer3,answer4):
	$"/root/Global".question.append(question)
	$"/root/Global".Ans.append(str("ก)",answer1,"     ข)",answer2,"     ค)",answer3,"     ง)",answer4))
	$"/root/Global".correct.append(correct)



func _answer(correct,answer): #ตรวจคำตอบ
	if correct == answer && not check_button: #ตอบถูก
		hp_enemy(-20)
		$AudioCorrect.playing = true
		$player.skill()
		#Answer()
		_exam(question,correct,true,$"/root/Global".chapter)
		$Timer2.start()
		return true
	else:#ตอบผิด
		attack("enemy")
		hp_player(-20)
		$AudioWrong.playing = true
		Answer()
		_exam(question,correct,false,$"/root/Global".chapter)
		#import_exam()

		return false



func import_exam(): # เลือก Chapter ของข้อสอบ
	var importexam = exam
	var rng = $"/root/ExamInventory".index($"/root/Global"._Exam)
	record(importexam[rng].Question,importexam[rng].Correct,importexam[rng].answer1,
	importexam[rng].answer2,importexam[rng].answer3,importexam[rng].answer4)
	_show(importexam[rng].Question,importexam[rng].answer1,importexam[rng].answer2,importexam[rng].answer3,importexam[rng].answer4)
	correct = importexam[rng].Correct
	Q = str("คำถาม ",importexam[rng].Question)
	A = str("คำตอบ ",importexam[rng].Correct)
	$TextureProgress.value = Time
	#print(A)
	question = importexam[rng].Question
	


func finish(value:String,hp:int): #player or Enemy
	$"/root/Global".playerwalk = true
	if value == "player" && hp <= 0:
		get_tree().change_scene("res://src/scene/Answer.tscn")
		$"/root/Player".player.hp = playerhp  - 10
	elif value == "enemy" && hp <= 0:
		$"/root/MissionInventory"._save_mission.save[$"/root/Global".number_index] = true
		#$"/root/MissionInventory".set_value($"/root/Global".number_enemy+1,$"/root/Global".number_index,"finish",true)
		if $"/root/Player".player.hp < 100:
			$"/root/Player".player.hp = playerhp  + 10
		#clear_enemy
		get_tree().change_scene("res://src/scene/Answer.tscn")


func _on_Timer_timeout():#จับเวลา
	if $TextureProgress.value < 60:
		$TextureProgress.value += 1
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



func exam(group:int):
	exam= $"/root/ExamInventory".exam(group)

var Q #คำถาม
var A #คำตอบ

func Answer():
	check_button = true
	$answer/Timer_answer.start()
	pass

func _on_Button_button_down():
	check_button = false
	$TextureProgress.value = Time
	$answer.hide()
	$TextureProgress.show()
	exam($"/root/Global"._Exam)
	$answer1.disabled = false
	$answer2.disabled = false
	$answer3.disabled = false
	$answer4.disabled = false
	import_exam()
	pass # Replace with function body.


func _on_Timer_answer_timeout():
	$answer/Q.text = str(Q)
	$answer/A.text = str(A)
	$answer.show()
	$TextureProgress.hide()
	$answer/Timer_answer.stop()
	pass # Replace with function body.

func _exam(question:String,answer:String,status:bool,chapter:String):
	var dic:Dictionary = {
		"question": question,
		"answer": answer,
		"status": status
	} 
	if chapter == "chapter1":
		$"/root/MissionInventory"._save_exam.chapter1.append(dic)
	if chapter == "chapter2":
		$"/root/MissionInventory"._save_exam.chapter2.append(dic)
	if chapter == "chapter3":
		$"/root/MissionInventory"._save_exam.chapter3.append(dic)
	if chapter == "chapter4":
		$"/root/MissionInventory"._save_exam.chapter4.append(dic)
	if chapter == "chapter5":
		$"/root/MissionInventory"._save_exam.chapter5.append(dic)
	if chapter == "chapter6":
		$"/root/MissionInventory"._save_exam.chapter6.append(dic)
	if chapter == "chapter7":
		$"/root/MissionInventory"._save_exam.chapter7.append(dic)
	if chapter == "chapter8":
		$"/root/MissionInventory"._save_exam.chapter8.append(dic)
	#ResourceSaver.save("user://exam/exam.tres",$"/root/MissionInventory"._save_exam)


func _on_Timer2_timeout():
	$answer1.disabled = false
	$answer2.disabled = false
	$answer3.disabled = false
	$answer4.disabled = false
	import_exam()
	$Timer2.stop()
	pass # Replace with function body.
