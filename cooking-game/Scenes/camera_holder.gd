
extends Node3D

var mouseSensitivity := 0.1
@onready var camera = $Camera3D

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		camera.rotate_x(deg_to_rad(-event.relative.y * mouseSensitivity))
		rotate_y(deg_to_rad(-event.relative.x * mouseSensitivity))

		camera.rotation_degrees.x = clamp(
			camera.rotation_degrees.x,
			-89.9,
			89.9
		)
