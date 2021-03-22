extends Node2D
func _ready():
	$GridContainer/Label1.text = ""
	$GridContainer/Label2.text = ""
	$GridContainer/Label3.text = ""
	$GridContainer/Label4.text = ""
	$GridContainer/Label5.text = ""
	$GridContainer/Label6.text = ""
	$GridContainer/Label7.text = ""
	$GridContainer/Label8.text = ""
	var audio = $AudioStreamPlayer2D.stream as AudioStreamOGGVorbis
	audio.set_loop(false)
	pass


func _on_Button_button_down():
	$AudioStreamPlayer2D.play()
	ResourceSaver.save($"/root/MissionInventory".chapter1.get_path(),$"/root/MissionInventory".chapter1)
	$GridContainer/Label1.text = "บันทึกเกมสำเร็จ"
	pass # Replace with function body.


func _on_back_button_down():
	$AudioStreamPlayer2D.play()
	if $"/root/Global".scene == 1:
		get_tree().change_scene("res://src/scene/chapter1.tscn")
	pass # Replace with function body.


func _on_score_button_down():
	$AudioStreamPlayer2D.play()
	get_tree().change_scene("res://src/scene/Overview.tscn")
	pass # Replace with function body.
