extends Node2D

func _ready():
	Events.connect("HUD",self,"HUD") 
	$Label.hide()
	$ColorRect.hide()
func _hide():
	$TextureProgress.hide()

func _show():
	$TextureProgress.show()

func HUD(show):
	if show:
		_show()
	else:
		_hide()
