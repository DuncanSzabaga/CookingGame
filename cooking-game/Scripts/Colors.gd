extends Node

var available_colors: Array[Color] = [
	Color.RED,
	Color.ORANGE,
	Color.YELLOW,
	Color.GREEN_YELLOW,
	Color.FOREST_GREEN,
	Color.AQUA,
	Color.BLUE,
	Color.PURPLE,
	Color.MAGENTA,
	Color.SADDLE_BROWN
]

func get_color() -> Color:
	if available_colors.is_empty():
		print("No colors available")
		return Color.WHITE

	var index = randi_range(0, available_colors.size() - 1)
	var color = available_colors[index]
	available_colors.remove_at(index)
	return color

func release_color(color: Color) -> void:
	if not available_colors.has(color):
		available_colors.append(color)
