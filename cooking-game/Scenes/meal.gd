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
	var score = 0
	var leftover = food_array.duplicate() #copy so it doesnt get messed up in grading
#correct ingredients
	for item in order:
		if leftover.has(item):
			score+= 10
			leftover.erase(item)
		else:
			#if not neg points
			score -= 10
#if player adds anything they weren't suppose to
#aka if player added cheese to a burger that was suppose to have no cheese
	for item in leftover:
		score-= 5
#correct ordering
#realistically burger wouldnt look like meat bun meat
	for i in range(min(food_array.size(), order.size())):
		if food_array[i] == order[i]:
			score += 5
	
	if food_array.size() >= 2 and food_array[0] == Food.FOOD_TYPES.BUN and food_array[-1] == Food.FOOD_TYPES.BUN:
		score += 10
	else:
		score -= 20

	print(score)
	return score
