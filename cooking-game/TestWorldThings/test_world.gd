extends Node3D

const Cell = preload("uid://dil63ebr7snf0")
const GRID_SIZE = 2

var cells = []

@export var Map: PackedScene

func _ready():
	generate_map()
	
func generate_map():
	if not Map is PackedScene: return
	var map = Map.instantiate()
	var tileMap = map.get_node("MapCreator")
	var used_tiles = tileMap.get_used_cells()
	map.free()
	for tile in used_tiles:
		var cell = Cell.instantiate()
		add_child(cell)
		cell.position = Vector3(tile.x*GRID_SIZE, 0, tile.y*GRID_SIZE)
		cells.append(cell)
	for cell in cells:
		cell.update_faces(used_tiles)
