extends CenterContainer

onready var ItemTextureRect = $ItemTextureRect

func display_item(item):
	if item is Item:
		ItemTextureRect.texture = item.texture
	else:
		ItemTextureRect.texture = load("res://assets/Items/EmptyInventorySlot.png")
