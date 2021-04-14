extends Node2D
export (bool) var test
var nextchapter:bool =  false
func _ready():
	if test && not $"/root/Global".test:
		$"/root/Global".player_pos = Vector2(1347.59,-1307.02)
		$"/root/Global".test = true
	else:
		
		$player.position = $"/root/MissionInventory"._save_player.position
	lable("chapter5_2_DB1")
	$"/root/Global".scene = 8
	solder()
	

func _process(delta):
	$"/root/MissionInventory"._save_player.position = $player.position
	finished()
func _on_5_1_1_body_entered(body):
	if body.get_name() == "player":
		$"/root/MissionInventory"._save_player.position = Vector2(5369.89,-1340.05)
		$"/root/Scene".scene(19)
	pass # Replace with function body.

func lable(value:String):
	$"/root/Global"._dialogbox = value
	if $dialogbox._dialogbox(true):
		$"/root/Global".player_pos = $player.position
		$dialogbox.show()
		$dialogbox.position.x = $player.position.x -660
		$dialogbox.position.y = $player.position.y + 120
		$dialogbox._dialogbox(true)

func solder():
	var inst = load("res://src/scene/Enemy/soldier1.tscn").instance()
	inst.position = Vector2(2151.599,-1603.653)
	inst._dialogbox = "chapter5_2_DB2"
	inst.text = "ทหาร"
	add_child(inst)

func finished():
	if $"/root/MissionInventory"._save_dialogbox.save[28] && not nextchapter:
		$wall/blocked.queue_free()
		nextchapter = true

