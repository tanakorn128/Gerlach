extends Resource
class_name Enemy

export (Texture) var texture
export (int) var damage
export (Vector2) var location

enum EnemyType {
	simple ,
	Trash,
	Sort,
	angle,
}

export (EnemyType) var Enemy_Type
