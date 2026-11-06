extends Node3D

const Cell = preload("uid://dil63ebr7snf0")
const OpenCell = preload("uid://cwwn3uyfc3gkc")
const WindowCell = preload("uid://m01iqtauisyo")

const GRID_SIZE = 2

var cells = []
var cell_IDs = []

@export var Map: PackedScene

func _ready():
	generate_map()
	
func generate_map():
	if not Map is PackedScene: return
	var map = Map.instantiate()
	var tileMap = map.get_node("MapCreator")
	var used_tiles = tileMap.get_used_cells()
	for source in used_tiles:
		cell_IDs.append(tileMap.get_cell_source_id(source))
	map.free()
	var index = 0
	for tile in used_tiles:
		var cell
		if cell_IDs[index] == 0:
			cell = Cell.instantiate()
		elif cell_IDs[index] == 1:
			cell = OpenCell.instantiate()
		elif cell_IDs[index] == 2:
			cell = WindowCell.instantiate()
		else:
			cell = Cell.instantiate()
		add_child(cell)
		cell.position = Vector3(tile.x*GRID_SIZE, 0, tile.y*GRID_SIZE)
		cells.append(cell)
		index += 1
	for cell in cells:
		cell.update_faces(used_tiles)
