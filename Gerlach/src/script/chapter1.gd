extends Node2D


export (Script) var game_save 

func _ready():
	$"/root/Global".scene = 1
	
func _process(delta):
	update()
	if $player.position.x > $player/Camera2D.limit_right:
		get_tree().change_scene("res://src/scene/An/chapter2.tscn")

func change():
	$HUD.position.x = $player.position.x - 600
	$HUD.position.y = $player.position.y - 350

func update():
	change()


func _on_mailbox1_body_entered(body):
	if body.get_name() == "player":
		Events.emit_signal("postbox")
		get_tree().change_scene("res://src/scene/postbox.tscn")
		
		



