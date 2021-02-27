extends Node2D
const HUDPOSY = 350
const HUDPOSX = 600
var chapter2 = false
func _ready():
	$dialogbox1.show()
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
	pass

func HP():
	$HUD/TextureProgress.value = $"/root/Global".PlayerHP
func player_Collisioion(Collisioion):
	pass
