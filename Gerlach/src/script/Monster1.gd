extends Node2D

func _ready():
	$HUD/TextureProgress.value = 100

func _process(delta):
	if $HUD/TextureProgress.value <= 0:
		queue_free()
		get_tree().change_scene("res://src/scene/chapter1.tscn")

func hp(value:int):
	$HUD/TextureProgress.value += value


func _on_Area2D_body_entered(body):
	
	pass # Replace with function body.

