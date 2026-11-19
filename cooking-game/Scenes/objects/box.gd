extends StaticBody3D
class_name FoodBox

enum FOOD_TYPES {
	BUN,
	PATTY,
	UNDERCOOKED_PATTY,
	COOKED_PATTY,
	BURNT_PATTY,
	CHEESE,
	LETTUCE
}

@export var food_type: FOOD_TYPES = FOOD_TYPES.BUN

func _ready() -> void:
	$food_label.text = FOOD_TYPES.keys()[food_type]
