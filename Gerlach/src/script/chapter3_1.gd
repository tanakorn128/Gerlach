extends Node2D
const HUDPOSY = 350
const HUDPOSX = 600
var area:bool = false
func _ready():
	lable("chapter3_1_dialogbox1")
	_mission()
	
func _process(delta):
	#$"/root/Global".player_pos.x = $player.position.x
	#$"/root/Global".player_pos.y = $player.position.y
	pass


func lable(value:String):
	$"/root/Global"._dialogbox = value
	print($dialogbox._dialogbox(true))
	if $dialogbox._dialogbox(true):
		$"/root/Global".player_pos = $player.position
		$dialogbox.show()
		$dialogbox.position.x = $player.position.x -660
		$dialogbox.position.y = $player.position.y + 120
		$dialogbox._dialogbox(true)




func _on_chapter3_2_body_entered(body):
	if body.get_name() == "player":
		$"/root/MissionInventory"._save_player.position = Vector2(977.103,-274.977)
		$"/root/Scene".scene(4)
	pass # Replace with function body.

func _mission():
	var arr = $"/root/Global"._mission
	arr.clear()
	arr.append("ภารกิจ : เดินทางไปยังป้อมปราการ เพื่อตรวจสถานการณ์ที่เกิดขึ้น")
