extends Node2D
var number_index:int = 0
var type_enemy:int = 2
var _dialogbox:String
var exam:bool = false
var finished:bool = true
var _scene:int
var savedialog:bool = false
func _ready():
	$dialogbox._changescene = true
	$dialogbox.scene = _scene
func _process(delta):
	finisheddialogbox()
	pass
func lable(value:String):
	$"/root/Global"._dialogbox = value
	if $dialogbox._dialogbox(savedialog):
		$dialogbox.show()
		$dialogbox.position.x = -get_viewport_rect().size.x/2
		$dialogbox.position.y = -get_viewport_rect().size.y/13
		$dialogbox._dialogbox(savedialog)


func _on_Area2D_body_entered(body):
	lable(_dialogbox)
	print("T")
	pass # Replace with function body.


func _exam():
	$"/root/Global".enemy = "soldler2"
	$"/root/Global".number_index = number_index
	$"/root/Scene".Type(type_enemy)
	

func hp(value:int):
	$HUD/TextureProgress.value += value

func get_hp():
	return $HUD/TextureProgress.value

func finisheddialogbox():
	if $dialogbox.finished && finished:
		_exam()
		finished = false

func attack():
	pass
