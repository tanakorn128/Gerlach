extends Node2D
var Enemy = preload("res://assets/Enemys/Tree.tres")
var Enemys = preload("res://assets/Enemys/Enemys.tres")
func _ready():
	print(Enemys.Enemy[0].name)
	pass
