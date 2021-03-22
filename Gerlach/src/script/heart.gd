extends Node2D

func _ready():
	$AnimationPlayer.play("idle")

func _on_Area2D_body_entered(body):
	#Events.emit_signal("heart")
	#if $"/root/Global".PlayerHP <= 80:
	#	$"/root/Global".PlayerHP += 20
	#	Events.emit_signal("HP")
	#	queue_free()
	#else:
	#	$"/root/Global".PlayerHP = 100
	#	Events.emit_signal("HP")
	#	queue_free()
	pass # Replace with function body.
