extends Node2D

var nextchapter:bool = false

func _ready():
	$"/root/Global".scene = 18
	$player.position = $"/root/MissionInventory"._save_player.position
	solider()
	

func _process(delta):
	$"/root/MissionInventory"._save_player.position = $player.position
	finished()

func _on_chapter6_1_body_entered(body):
	if body.get_name() == "player":
		$"/root/Scene".scene(9)
	pass # Replace with function body.

func lable(value:String):
	$"/root/Global"._dialogbox = value
	if $dialogbox._dialogbox(true):
		$"/root/Global".player_pos = $player.position
		$dialogbox.show()
		$dialogbox.position.x = $player.position.x -660
		$dialogbox.position.y = $player.position.y + 120
		$dialogbox._dialogbox(true)

func solider():
	var inst = load("res://src/scene/Enemy/soldier1.tscn").instance()
	inst.position = Vector2(3218.19,-2278.22)
	inst._dialogbox = "chapter4_2_2_DB1"
	inst.text = "ทหารคนที่ 3"
	add_child(inst)

func finished():
	if $"/root/MissionInventory"._save_dialogbox.save[29] && not nextchapter:
		$wall/blocked2.queue_free()
		nextchapter = true
