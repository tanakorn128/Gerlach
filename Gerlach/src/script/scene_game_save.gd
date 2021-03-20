extends Node2D

export (Script) var game_save 
onready var new_save = game_save.new()

func _ready():
	_load()

func player_position(pos):
	new_save.player_pos = pos

func _load():
	var _load = load("user://save_01.tres")
	print(_load.player_pos)


func _save():
	new_save.player_pos = self.position
	ResourceSaver.save("user://save_01.tres",new_save)


