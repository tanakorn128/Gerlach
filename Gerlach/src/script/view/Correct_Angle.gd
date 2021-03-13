extends Panel
var resource = preload("res://src/script/Exam/Exam_All/Angle.tres")
var arr_Textures:Array
var arr_Angle_Chapter1
var start = false
func _ready():
	arr_Angle_Chapter1 = $"/root/Global".Angle_Chapter1
	

	pass
func _process(delta):
	if start:
		add_textures(arr_Angle_Chapter1["data"]["image1"])
		add_textures(arr_Angle_Chapter1["data"]["image2"])
		add_textures(arr_Angle_Chapter1["data"]["angle1"])
		add_textures(arr_Angle_Chapter1["data"]["angle2"])
		#add_textures(resource.ExamAll[0].angle)
		
		$TextureRect1.texture = arr_Textures[0]
		$TextureRect2.texture = arr_Textures[1]
		$TextureRect3.texture = arr_Textures[2]
		$TextureRect4.texture = arr_Textures[3]
		start = false
	pass
func add_textures(img):
	var Textures:Texture
	Textures = img
	arr_Textures.append(Textures)
	pass
