extends Node2D
var arr
var ItemNo
func _ready():
	arr = $"/root/Global".arr_Correct_Chapter1
	#dic_exam["Type"] = "Type0"
	#dic_exam["chapter"] = "chapter0"
	#arr.append(dic_exam["data"])
	if arr.size() > 0:
		for i in arr.size():
			$ItemList.add_item(str(i+1,")",arr[i]),null,true)
	#$ItemList.add_item(str("1"),null,true)
	#$ItemList.add_item(str("2"),null,true)
	pass

func ReportListItem():
	ItemNo = $ItemList.get_selected_items()
	print(ItemNo,"ItemNo")
	if arr.size() > 0:
		if arr[ItemNo[0]] == "จับคู่มุม":
			$Angle.start = true
			$ItemList.hide()
			$Angle.show()




func _on_Button_button_down():
	ReportListItem()
	pass # Replace with function body.


func _on_back_button_down():
	get_tree().change_scene("res://src/scene/Overview.tscn")
	pass # Replace with function body.
