extends Node2D
const HUDPOSY = 350
const HUDPOSX = 600
const PausePOSX = 1100
const PausePOSY = 350
var chapter2 = false
var chnger_scene = false
export (Script) var game_save 

func _ready():
	#$dialogbox1.show()
	$player.show()
	#$HUD/TextureProgress.value = $"/root/Global".PlayerHP
	$HUD/Label.show()
	$HUD/ColorRect.show()
	Events.connect("HP",self,"HP")
	Events.connect("player_Collisioion_mission",self,"player_Collisioion")
	get_node("/root/Global").scene = 1
	

func _process(delta):
	update()
	if $player.position.x > $player/Camera2D.limit_right:
		$"/root/ChangeScene".change(2)
func change():
	$HUD.position.x = $player.position.x - HUDPOSX
	$HUD.position.y = $player.position.y - HUDPOSY
	#$"/root/Pause".position = $player.position
	#$"/root/Pause".position.y = $player.position.y - PausePOSY

func update():
	HP()
	change()

func HP():
	#$HUD.set_health($"/root/Global".PlayerHP)
	pass

var mailbox1 = false

func player_Collisioion(Collisioion):
	mailbox1 = Collisioion
	chnger_scene = Collisioion
	pass


func _on_mailbox1_body_entered(body):
	if body.get_name() == "player":
		print(body.get_name())
		var inst = load("res://src/scene/dialogbox/dialogbox_all.tscn").instance()
		add_child(inst)


func _on_change_scene_chapter2_body_entered(body):
	if chnger_scene:
		get_tree().change_scene("res://src/scene/chapter2.tscn")

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


