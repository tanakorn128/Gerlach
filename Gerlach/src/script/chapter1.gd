extends Node2D
const HUDPOSY = 350
const HUDPOSX = 600
const PausePOSX = 1100
const PausePOSY = 350

var chapter2 = false
func _ready():
	$dialogbox1.show()
	$player.show()
	Events.connect("player_position",self,"player_position")
	$HUD.position.x = $"/root/Global".player.x - HUDPOSX
	$HUD.position.y = $"/root/Global".player.y - HUDPOSY
	$HUD/TextureProgress.value = $"/root/Global".PlayerHP
	$HUD/Label.show()
	$HUD/ColorRect.show()
	Events.connect("HP",self,"HP")
	Events.connect("player_Collisioion_mission",self,"player_Collisioion")
	get_node("/root/Global").scene = 1
	pass

func player_position(position):
	$HUD.position.x = position.x - HUDPOSX
	$HUD.position.y = position.y - HUDPOSY
	$Pause.position.x = position.x - PausePOSX
	$Pause.position.y = position.y - PausePOSY
	pass

func HP():
	$HUD/TextureProgress.value = $"/root/Global".PlayerHP

var mailbox1 = false

func player_Collisioion(Collisioion):
	mailbox1 = Collisioion
	pass


func _on_mailbox1_body_entered(body):
	
	if mailbox1:
		var inst = load("res://src/scene/dialogbox/dialogbox_all.tscn").instance()
		add_child(inst)
	
	pass # Replace with function body.
