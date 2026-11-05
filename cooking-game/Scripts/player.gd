extends CharacterBody3D

var input_direction: Vector2
var speed: float = 6.0

@export var look_sensitivity: float = 0.005
@export var acceleration = 60.0


@onready var head: Node3D = $Head
@onready var camera: Camera3D = $Head/Camera3D
@onready var pointer: Sprite3D = $Head/Camera3D/Pointer

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	pointer.visible = true

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		head.rotate_y(-event.relative.x * look_sensitivity)
		camera.rotate_x(-event.relative.y * look_sensitivity)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-80), deg_to_rad(80))
		
	if Input.is_action_just_pressed("escape"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		pointer.visible = false
			
	if event is InputEventMouseButton and event.pressed:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		pointer.visible = true

func _physics_process(delta: float) -> void:
	# get direction input
	input_direction = Input.get_vector("left", "right", "up", "down")
	var direction = (head.transform.basis * Vector3(input_direction.x, 0, input_direction.y)).normalized()
	
	# calculate movement
	var target_velocity = direction * speed
	var horizontal_velocity = Vector3(velocity.x, 0, velocity.z)
	
	# movement
	horizontal_velocity = horizontal_velocity.move_toward(target_velocity, acceleration * delta)
	velocity.x = horizontal_velocity.x
	velocity.z = horizontal_velocity.z
	
	move_and_slide()
