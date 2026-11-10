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

func grade(order: Array):
	var score = 0.0
	var perfect_score = 0
	var meal_check = food_array.duplicate()
	var loop_counter = 0
	
	for food in order:
		perfect_score += 3
		if meal_check.has(food): #If the food is on the plate
			score += 3
			meal_check.erase(food)
		else: #If the food is not on the plate
			score -= 2
	for food in meal_check: #If food is on the plate that shouldn't be
		score -= 3
	
	if food_array.size() == order.size():
		for food in order:
			perfect_score += 5
			if food_array[loop_counter] == order[loop_counter]:
				score += 10
			else:
				score -= 9
			loop_counter += 1
	else: #If the meal size is different from the order size
		if food_array[0] != 0:
			score -= 10
		if food_array[food_array.size()-1] != 0:
			score -= 10
			
	if not food_array.has(1): #If the meal has no patty
		score = 0
	
	score = ceil(((max(0, score)) / perfect_score) * 100)
	print(score)
