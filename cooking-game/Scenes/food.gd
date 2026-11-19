extends Node3D
class_name Food

enum FOOD_TYPES {
	BUN,
	RAW_PATTY,
	UNDERCOOKED_PATTY,
	COOKED_PATTY,
	BURNT_PATTY,
	CHEESE,
	LETTUCE
}

@export var food_type: FOOD_TYPES = FOOD_TYPES.BUN

var food_mesh_array = [
	preload("uid://c8oyh7bs28q8f"),
	preload("uid://baxltgrrkusby"),
	preload("uid://rdgc3veay0mb"),
	preload("uid://ctxkdojvek4db"),
	preload("uid://cggjjgtbevsu6"),
	preload("uid://c4yjrg0ktirfu")
]

var cooking_timer = 0.0
var is_cooking: bool = false

func _ready() -> void:
	$FoodItem.mesh = food_mesh_array[food_type]
	
func _process(delta: float) -> void:
	if is_cooking:
		cooking_timer += delta
		if cooking_timer >= 3:
			cooking_timer = 0.0
			if food_type >= 1 and food_type < 4:
				food_type += 1
				update_food()
			else:
				queue_free()

func update_food():
	$FoodItem.mesh = food_mesh_array[food_type]
