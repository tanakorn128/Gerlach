extends Control

export (NodePath) var dropdown_path
onready var dropdown = get_node(dropdown_path)


func _ready():
	add_items()
	pass

func add_items():
	$dropdown.add_item("Chapter 1",1)
	$dropdown.add_item("Chapter 2",2)
	$dropdown.add_item("Chapter 3",3)
	$dropdown.add_item("Chapter 4",4)
	$dropdown.add_item("Chapter 5",6)
	$dropdown.add_item("Chapter 5",7)

	pass
