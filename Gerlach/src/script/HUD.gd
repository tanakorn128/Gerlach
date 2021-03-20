extends Node2D

func _hide():
	$TextureProgress.hide()
	$Label.hide()
	$ColorRect.hide()

func _show():
	$TextureProgress.show()
	$Label.show()
	$ColorRect.show()

func set_health(hp:int):
	$TextureProgress.value = hp

func Health_down(hp:int):
	$TextureProgress.value -= hp


func Health_up(hp:int):
	$TextureProgress.value += hp

