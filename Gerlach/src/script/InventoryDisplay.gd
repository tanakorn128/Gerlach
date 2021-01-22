extends GridContainer

var inventory = preload("res://assets/Items/Inventory.tres")

func _ready():
	Events.connect("items_changed",self,"_on_items_changed")
	inventory.connect("items_changed",self,"_on_items_changed")
	print("R")


func update_inventory_display():
	for item_index in inventory.items.size():
		update_inventory_slot_display(item_index)

func update_inventory_slot_display(item_index):
	var inventorySlotDisplay = get_child(item_index)
	var item = inventory.items[item_index]
	inventorySlotDisplay.display_item(item)
	print("T")

func _on_items_changed(indexes):
	for item_index in indexes:
		update_inventory_slot_display(item_index)
