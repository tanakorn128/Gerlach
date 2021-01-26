extends Node2D
var hud : Vector2
func _ready():
	hud.x = 310
	hud.y = 330
	Events.connect("player_position",self,"player_position")
	$HUD.position.x = hud.x
	$HUD.position.y = hud.y
	var inst_scene3 = load("res://src/scene/scene3.tscn").instance()
	#add_child(inst_scene3)
	Events.emit_signal("HUD",true)
	pass

func _process(delta):
	
	pass

func player_position(position):
	#ย่าย HUD ตามผู้เล่น
	$HUD.position.x = position.x + hud.x
	$HUD.position.y = position.y + hud.y
	pass


