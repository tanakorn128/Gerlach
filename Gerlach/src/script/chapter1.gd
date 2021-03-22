extends Node2D
const HUDPOSY = 350
const HUDPOSX = 600
const PausePOSX = 1100
const PausePOSY = 350
export (Script) var game_save 

func _ready():
	$"/root/Global".scene = 1
	$player.show()
	#$HUD/TextureProgress.value = $"/root/Global".PlayerHP
	$HUD/Label.show()
	$HUD/ColorRect.show()
	Events.connect("HP",self,"HP")
	Events.connect("player_Collisioion_mission",self,"player_Collisioion")
	

func _process(delta):
	update()
	if $player.position.x > $player/Camera2D.limit_right:
		get_tree().change_scene("res://src/scene/An/chapter2.tscn")

func change():
	$HUD.position.x = $player.position.x - HUDPOSX
	$HUD.position.y = $player.position.y - HUDPOSY
	#$"/root/Pause".position = $player.position
	#$"/root/Pause".position.y = $player.position.y - PausePOSY

func update():
	change()


func _on_mailbox1_body_entered(body):
	if body.get_name() == "player":
		get_tree().change_scene("res://src/scene/postbox.tscn")
		
		


func _load():
	var chapter1 = load("user://save_01.tres")
	if chapter1.get("player_pos") == null:
		print("Null")
	else:
		print("not_null")

func _save():
	var new_save = game_save.new()
	new_save.player_pos = $player.position
	ResourceSaver.save("user://save_01.tres",new_save)


