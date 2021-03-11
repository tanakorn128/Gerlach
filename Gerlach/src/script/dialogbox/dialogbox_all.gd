extends Node2D

func _ready():
	text()
	$dialogbox.get_text(0)

func text():
	$dialogbox.set_text("MailBox")
	$dialogbox.audio = true
