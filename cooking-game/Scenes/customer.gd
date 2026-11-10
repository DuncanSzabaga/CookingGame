extends CharacterBody3D
class_name Customer

var order = [Food.FOOD_TYPES.BUN, Food.FOOD_TYPES.PATTY, Food.FOOD_TYPES.CHEESE, Food.FOOD_TYPES.BUN]

func _ready() -> void:
	var text = ""
	for item in order:
		text = Food.FOOD_TYPES.keys()[item] + "\n"
		pass
	$Label3D.text = text
func show_order() -> void:
	$Label3D.visible = true
