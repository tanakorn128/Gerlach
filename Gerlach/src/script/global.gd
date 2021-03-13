extends Node
var player = Vector2(0,0)
var PlayerHP = 100
var mission
var mission_Success = false
#ส่วนของ Mission เมื่อเริ่มต่อสู้
var Enemy_Name
var damage
var L_mission #ชื่อภารกิต
######
var mission_complete:Array #ภารกิจสำเร็จ

var save:Dictionary

##############dialogbox ##################
var chapter1_Start = true
var scene

### เก็บข้อสอบถูก ผิด

var Wrong_Chapter1 = 0
var Correct_Chapter1 = 0
var arr_Correct_Chapter1:Array
var arr_Angle_Chapter1:Array
var dic_Correct_Chapter1 = {
	"data":{
		"Type": "X",
		"chapter": "x"}
	}
var Angle_Chapter1 = {
	"data":{
		"image1": "X",
		"angle1": "x",
		"answer1": false,
		"image2": "x",
		"angle2": "x"},
		"answer2": false
	}
	
var Wrong_Chapter2 = 0
var Correct_Chapter2 = 0
var Wrong_Chapter3 = 0
var Correct_Chapter3 = 0
var Wrong_Chapter4 = 0
var Correct_Chapter4 = 0
var Wrong_Chapter5 = 0
var Correct_Chapter5 = 0
var Wrong_Chapter6 = 0
var Correct_Chapter6 = 0
var Wrong_Chapter7 = 0
var Correct_Chapter7 = 0
