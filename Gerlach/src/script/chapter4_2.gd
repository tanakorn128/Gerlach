extends Node2D
onready var chapter = $"/root/MissionInventory"
var _Enemys
var _Enemys5_3
var state_Enemys5_3:bool = false
var state_Enemys6_2:bool = false
var _dialogbox:bool = false
var soldier1:bool 
var soldier2:bool
var soldier3:bool
var area:bool = false
export (bool) var test

func _ready():
	$"/root/MissionInventory"._save_player.chapter = 6
	
	if test && not $"/root/Global".test:
		$"/root/Global".player_pos = Vector2(2503.74,807.724)
		$"/root/Global".test = true
	else:
		$player.position = $"/root/MissionInventory"._save_player.position
	$"/root/Global".scene = 6
	$"/root/Global"._Exam = 2
	lable("chapter4_2_dialogbox1")
	$postbox/Timer.start()
	finished()
func _process(delta):
	$"/root/MissionInventory"._save_player.position = $player.position

func lable(value:String):
	$"/root/Global"._dialogbox = value
	if $dialogbox._dialogbox(true):
		$"/root/Global".player_pos = $player.position
		$dialogbox.show()
		$dialogbox.position.x = $player.position.x -660
		$dialogbox.position.y = $player.position.y + 120
		$dialogbox._dialogbox(true)


func _on_postbox_body_entered(body):
	$"/root/Global".scene = 6
	if body.get_name() == "player" && area:
		Events.emit_signal("postbox")
		get_tree().change_scene("res://src/scene/postbox.tscn")
	pass # Replace with function body.

func finished():
	if $"/root/MissionInventory"._save_dialogbox.save[23]:
		$wall/blocked.queue_free()
	pass


func _on_Timer_timeout():
	area = true
	$postbox/Timer.stop()
	pass # Replace with function body.


func _on_chapter5_1_body_entered(body):
	if body.get_name() == "player":
		$"/root/Scene".scene(7)
	pass # Replace with function body.
