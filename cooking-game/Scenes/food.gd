extends Node3D
class_name Food

enum FOOD_TYPES {
	BUN,
	PATTY,
	CHEESE,
	LETTUCE
}

@export var food_type: FOOD_TYPES = FOOD_TYPES.BUN

var food_mesh_array = [
	preload("uid://c8oyh7bs28q8f"),
	preload("uid://ctxkdojvek4db"),
	preload("uid://c4yjrg0ktirfu")
]

func _ready() -> void:
	$FoodItem.mesh = food_mesh_array[food_type]
	pass
