extends Node2D

func _ready():
	$HUD/TextureProgress.value = 100


func hp(value:int):
	$HUD/TextureProgress.value += value


func _on_Area2D_body_entered(body):
	
	pass # Replace with function body.
