extends Node2D

func _ready():
	$"/root/Global".Correct_Chapter1 = 2
	$"/root/Global".Wrong_Chapter1 = 4
	add_score()
	
	pass
	
func add_score():
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
