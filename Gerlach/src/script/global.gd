extends Node
var scene:int
var Enemy_damage:int = 20
var Player_damage:int = 20
var number_index:int
var enemy:String
var test:bool = false
var _dialogbox:String
var Enemy_pos:Vector2
var _mission:Array
var chapter:String
#-----------------------------------------------------------------------
#Allchapter
var player_pos:Vector2 = Vector2(721.7,850.025)
var PlayerHP
var playerwalk:bool = true
var number_enemy:int
#chapter1
var chapter1_Enemy:Array
var chapter_mission:Array
#chapter2

#chapter4_2
#เฉลยข้อสอบ
var question:Array
var Ans:Array
var correct:Array

##ชุดข้อสอบ
var _Exam:int
####
#chapter complete
var chapter6_2:bool = false


########mission#########
var chapter1_monster:bool = false
var chapter4_2_soldier1:bool = false
var chapter4_2_soldier2:bool = false

############ Dialogbox ###################
var chapter2_dialogbox2:bool = false
