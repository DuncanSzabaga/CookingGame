extends Node3D
class_name Meal

var food_array = []

func add_food_to_array(food_item):
	food_item.get_parent().remove_child(food_item)
	add_child(food_item)
	#food_item.set_script(load("uid://cobbi14glbu2w"))
	food_item.global_position = global_position
	food_item.position.y += 0.5
	food_item.remove_from_group("Food")
	food_array.append(food_item.food_type)
