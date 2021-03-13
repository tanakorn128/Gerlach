extends Node2D
var chapter
var chapter1_color
func _ready():
	#$"/root/Global".Correct_Chapter1 = 2
	#$"/root/Global".Wrong_Chapter1 = 4
	show_score()
	chapter1_color = $"Correct/chapter 1".get_color("font_color")
	pass

func show_score():
	$"Correct/chapter 1".text = str(check_null($"/root/Global".Correct_Chapter1)," ข้อ")
	$"Correct/chapter 2".text = str(check_null($"/root/Global".Correct_Chapter2)," ข้อ")
	$"Correct/chapter 3".text = str(check_null($"/root/Global".Correct_Chapter3)," ข้อ")
	$"Correct/chapter 4".text = str(check_null($"/root/Global".Correct_Chapter4)," ข้อ")
	$"Correct/chapter 5".text = str(check_null($"/root/Global".Correct_Chapter5)," ข้อ")
	$"Correct/chapter 6".text = str(check_null($"/root/Global".Correct_Chapter6)," ข้อ")
	$"Correct/chapter 7".text = str(check_null($"/root/Global".Correct_Chapter7)," ข้อ")
	$"Wrong/chapter 1".text = str(check_null($"/root/Global".Wrong_Chapter1)," ข้อ")
	$"Wrong/chapter 2".text = str(check_null($"/root/Global".Wrong_Chapter2)," ข้อ")
	$"Wrong/chapter 3".text = str(check_null($"/root/Global".Wrong_Chapter3)," ข้อ")
	$"Wrong/chapter 4".text = str(check_null($"/root/Global".Wrong_Chapter4)," ข้อ")
	$"Wrong/chapter 5".text = str(check_null($"/root/Global".Wrong_Chapter5)," ข้อ")
	$"Wrong/chapter 6".text = str(check_null($"/root/Global".Wrong_Chapter6)," ข้อ")
	$"Wrong/chapter 7".text = str(check_null($"/root/Global".Wrong_Chapter7)," ข้อ")
	
	pass

func check_null(data):
	if data == null:
		return 0
		pass
	else:
		return data
	pass


func _on_Button_button_down():
	Events.emit_signal("change",$"/root/Global".scene)
	pass # Replace with function body.


func _input(event):
	if Input.is_action_pressed("mouse left"):
		if chapter == 1:
			get_tree().change_scene("res://src/scene/view/Correct.tscn")
		pass



func _on_chapter1_mouse_entered():
	chapter = 1
	$"Correct/chapter 1".add_color_override("font_color",Color(1, 0.5, 0))
	pass # Replace with function body.


func _on_chapter1_mouse_exited():
	$"Correct/chapter 1".add_color_override("font_color",chapter1_color)
	chapter = null
	pass # Replace with function body.
