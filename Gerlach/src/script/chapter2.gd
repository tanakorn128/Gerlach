extends Node2D
const HUDPOSY = 350
const HUDPOSX = 600

func _ready():
	$"/root/Global".scene = 2
	
func _process(delta):
	update()

func change():
	$HUD.position.x = $player.position.x - HUDPOSX
	$HUD.position.y = $player.position.y - HUDPOSY

func update():
	change()


func _on_postbox_body_entered(body):
	$"/root/Global".scene = 2
	if body.get_name() == "player":
		Events.emit_signal("postbox")
		get_tree().change_scene("res://src/scene/postbox.tscn")
	pass # Replace with function body.
