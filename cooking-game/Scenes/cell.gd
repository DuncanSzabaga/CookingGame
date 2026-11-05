extends Area3D
class_name Cell

const GRID_SIZE = 2

@onready var topFace: = $TopFace
@onready var bottomFace: = $BottomFace
@onready var northFace: = $NorthFace
@onready var eastFace: = $EastFace
@onready var southFace: = $SouthFace
@onready var westFace: = $WestFace

func update_faces(cell_list) -> void:
	var my_grid_position = Vector2(position.x/GRID_SIZE, position.z/2)
	if cell_list.has(my_grid_position + Vector2.RIGHT):
		eastFace.hide()
	if cell_list.has(my_grid_position + Vector2.LEFT):
		westFace.hide()
	if cell_list.has(my_grid_position + Vector2.DOWN):
		southFace.hide()
	if cell_list.has(my_grid_position + Vector2.UP):
		northFace.hide()
