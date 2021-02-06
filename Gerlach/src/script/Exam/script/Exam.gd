extends Resource

class_name Exam

#export (Texture) var Texture
export (String,MULTILINE) var Question
export (String) var answer1
export (String) var answer2
export (String) var answer3
export (String) var answer4
export (String) var Correct

enum StageType {
	COUNTING,
	ANGLE_AND_PARALLEL_LINES,
	STAT_AND_PROB,
	FRACTION,
	DECIMAL,
	APPLY,
	GEOMETRY,
	GEOMETRIC_AREA
}

enum Badge {
	CALCULATION, # การคำนวณ
	GUESSOR, # การคาดคะเน
	FUNCTION, # ฟังก์ชัน
	FAST_CALCULATOR, # คิดเร็ว
	ACCURATE, # แม่นยำ
	SHORT_TERM_MEM, # ความจำระยะสั้น
	NOTICE, # การสังเกต
	THINKING, # การคิดวิเคราะห์
	IMAGINATION, # จินตนาการ
	MEDITATION # สมาธิ
}

export (StageType) var stage_type
export (Array, Badge) var stage_badges
