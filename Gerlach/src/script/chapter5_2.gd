extends Node2D
const HUDPOSY = 350
const HUDPOSX = 600

func _process(delta):
	update()

func change():
	$HUD.position.x = $player.position.x - HUDPOSX
	$HUD.position.y = $player.position.y - HUDPOSY

func update():
	change()

func _on_chapter5_3_body_entered(body):
	if body.get_name() == "player":
		$"/root/Scene".scene(5.3)
	pass # Replace with function body.
