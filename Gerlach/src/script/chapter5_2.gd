extends Node2D
func _ready():
	lable("chapter5_2_start")

func _on_chapter5_3_body_entered(body):
	if body.get_name() == "player":
		$"/root/Scene".scene(5.3)
	pass # Replace with function body.

func lable(value:String):
	$"/root/Global"._dialogbox = value
	if $dialogbox._dialogbox(true):
		$"/root/Global".player_pos = $player.position
		$dialogbox.show()
		$dialogbox.position = $player.position - get_viewport_rect().size/2
		$dialogbox.position.y = $player.position.y - get_viewport_rect().size.y/13
		$dialogbox._dialogbox(true)
