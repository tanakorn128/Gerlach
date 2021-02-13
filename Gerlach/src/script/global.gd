extends Node
var player = Vector2(400,400)
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
