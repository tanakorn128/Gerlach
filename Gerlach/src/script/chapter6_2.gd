extends Node2D
func _ready():
	$"/root/Global"._Exam = 3
	lable("chapter6_2_dialogbox1")
	soldier()


func lable(value:String):
	$"/root/Global"._dialogbox = value
	if $dialogbox._dialogbox(true):
		$"/root/Global".player_pos = $player.position
		$dialogbox.show()
		$dialogbox.position.x = $player.position.x -660
		$dialogbox.position.y = $player.position.y + 120
		$dialogbox._dialogbox(true)

func soldier():
	var soldier = load("res://src/scene/Enemy/soldier1.tscn").instance()
	soldier.position = Vector2(1758.84,-1498.507)
	soldier._dialogbox = "chapter6_2_dialogbox2"
	add_child(soldier)


func _on_Area2D_body_entered(body):
	if body.get_name() == "player":
		$"/root/Global".chapter6_2 = false
		$"/root/Scene".scene(5)
	pass # Replace with function body.
