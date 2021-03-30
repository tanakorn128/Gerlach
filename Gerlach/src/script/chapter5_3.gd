extends Node2D
onready var chapter = $"/root/MissionInventory"
const HUDPOSY = 350
const HUDPOSX = 600

func _process(delta):
	update()

func change():
	$HUD.position.x = $player.position.x - HUDPOSX
	$HUD.position.y = $player.position.y - HUDPOSY

func update():
	change()

func lable(value:String):
	$"/root/Global"._dialogbox = value
	if $dialogbox._dialogbox(true):
		$"/root/Global".player_pos = $player.position
		$dialogbox.show()
		$dialogbox.position = $player.position - get_viewport_rect().size/2
		$dialogbox.position.y = $player.position.y - get_viewport_rect().size.y/13
		$dialogbox._dialogbox(true)


func _on_npc_body_entered(body):
	if body.get_name() == "player":
		lable("chapter5_3 npc 1")
	pass # Replace with function body.
