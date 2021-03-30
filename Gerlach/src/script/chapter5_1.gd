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
