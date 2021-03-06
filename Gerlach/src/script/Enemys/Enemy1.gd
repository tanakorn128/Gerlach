extends Node2D

var apple1:bool = false
var apple2:bool = false
var apple3:bool = false
var Ans1:bool
var Ans2:bool
var Ans3:bool
var Q1:float
var Q2:float
var Q3:float
var set_question:bool = true
var apple_position:Array
var inst_enemy
onready var Enemy_damage:int = $"/root/Global".Enemy_damage
onready var Player_damage:int = $"/root/Global".Player_damage
func _ready():
	$player.walk = false
	audio("loopstop")
	apple_position.append($Apple1.rect_position)
	apple_position.append($Apple2.rect_position)
	apple_position.append($Apple3.rect_position)
	set_question()
	enemy()

func _process(delta):
	if apple1 && not Ans1:
		$Apple1.rect_position.y = get_viewport().get_mouse_position().y
		Round_up("apple1")
		Round_down("apple1")
	if apple2 && not Ans2:
		$Apple2.rect_position.y = get_viewport().get_mouse_position().y
		Round_up("apple2")
		Round_down("apple2")
	if apple3 && not Ans3:
		$Apple3.rect_position.y = get_viewport().get_mouse_position().y
		Round_up("apple3")
		Round_down("apple3")
	if Ans1 && Ans2 && Ans3 && set_question:
		$Timer.start()
		set_question = false

func set_value(Apple1:float,Apple2:float,Apple3:float):
	$Apple1/Label.text = str(Apple1)
	$Apple2/Label.text = str(Apple2)
	$Apple3/Label.text = str(Apple3)
	
func answer(Question:String,value:int):
	var answer1 = round_place(Q1,0)
	var answer2 = round_place(Q2,0)
	var answer3 = round_place(Q3,0)
	if Question == "apple1":
		if value == answer1:
			audio("Correct")
			Ans1 = true
			set_question = true
			
			hp_enemy(-Player_damage)
		else:
			audio("wrong")
			Ans1 = true
			set_question = true
			hp_player(-Enemy_damage)
	if Question == "apple2":
		if value == answer2:
			audio("Correct")
			Ans2 = true
			hp_enemy(-Player_damage)
		else:
			audio("wrong")
			Ans2 = true
			hp_player(-Enemy_damage)
	if Question == "apple3":
		if value == answer3:
			audio("Correct")
			$Correct.play()
			Ans3 = true
			hp_enemy(-Player_damage)
		else:
			audio("wrong")
			$wrong.play()
			Ans3 = true
			hp_player(-Enemy_damage)

func audio(value:String):
	
	if value == "wrong":
		attack("enemy")
		$wrong.play()
	if value == "Correct":
		$Correct.play()
	if value == "loopstop":
		var audio = $Click.stream as AudioStreamOGGVorbis
		audio.set_loop(false)
		audio = $Correct.stream as AudioStreamOGGVorbis
		audio.set_loop(false)
		audio = $wrong.stream as AudioStreamOGGVorbis
		audio.set_loop(false)
func set_question():
	Ans1 = false
	Ans2 = false
	Ans3 = false
	Q1 = random()
	Q2 = random()
	Q3 = random()
	set_value(Q1,Q2,Q3)
	$Apple1.rect_position = apple_position[0]
	$Apple2.rect_position = apple_position[1]
	$Apple3.rect_position = apple_position[2]

func random():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var random_number = rng.randf_range(0.0, 10.0)
	random_number = "%.1f" % (random_number)
	return float(random_number)


func Round_up(apple:String):
	if get_viewport().get_mouse_position().y < 344:
		if apple == "apple1":
			answer(apple,(floor(Q1))+1)
		if apple == "apple2":
			answer(apple,(floor(Q2))+1)
		if apple == "apple3":
			answer(apple,(floor(Q3))+1)

func round_place(num,places):
	return (round(num*pow(10,places))/pow(10,places))

func Round_down(apple:String):
	if get_viewport().get_mouse_position().y > 577:
		if apple == "apple1":
			answer(apple,floor(Q1))
		if apple == "apple2":
			answer(apple,floor(Q2))
		if apple == "apple3":
			answer(apple,floor(Q3))

func _on_Apple1_button_down():
	apple1 = true
	$Click.play()
	pass # Replace with function body.


func _on_Apple1_button_up():
	apple1 = false
	pass # Replace with function body.


func _on_Apple2_button_down():
	$Click.playing = true
	apple2 = true
	pass # Replace with function body.


func _on_Apple2_button_up():
	apple2 = false
	pass # Replace with function body.


func _on_Apple3_button_down():
	$Click.playing = true
	apple3 = true
	pass # Replace with function body.

func _on_Apple3_button_up():
	apple3 = false
	pass # Replace with function body.




func _on_Timer_timeout():
	set_question()
	$Timer.stop()
	pass # Replace with function body.



func hp_player(value:int):
	$player.hp(value)
	finish("player",$player/HUD/TextureProgress.value)

func hp_enemy(value:int):
	inst_enemy.hp(value)
	finish("enemy",inst_enemy.get_hp())


func finish(value:String,hp:int): #player or Enemy
	if value == "player" && hp <= 0:
		$"/root/Scene".scene($"/root/Global".scene)
	elif value == "enemy" && hp <= 0:
		$"/root/MissionInventory".set_value($"/root/Global".scene,$"/root/Global".number_index,"finish",true)
		$"/root/Scene".scene($"/root/Global".scene)

func enemy():
	inst_enemy = $"/root/Scene".Enemy($"/root/Global".enemy)
	inst_enemy.position = Vector2(207.655,135.611)
	add_child(inst_enemy)

func attack(value:String):#player and enemy
	if value == "enemy":
		inst_enemy.attack()
	


func _on_Timer2_timeout():
	
	if $TextureProgress.value <= 0:
		hp_player(-20)
		$Timer.start()
		$TextureProgress.value = 60
	else:
		$TextureProgress.value -= 1
	pass # Replace with function body.
