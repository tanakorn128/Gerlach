extends Node2D

func _ready():
	$Label.hide()
	$ColorRect.hide()
func _hide():
	$TextureProgress.hide()

func _show():
	$TextureProgress.show()
