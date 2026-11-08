
extends CharacterBody3D

var walk_speed := 8.0
var acceleration_speed := 10.0
var heldObject: Object 
var _dir := Vector3.ZERO

@onready var camera = $CameraHolder
@onready var raycast = camera.get_node("Camera3D/RayCast3D")
@onready var holdPosition = camera.get_node("Camera3D/HoldPoint")


func _physics_process(delta: float) -> void:
	var input := Vector2.ZERO

	if Input.is_action_pressed("up"):
		input.y += 1

	if Input.is_action_pressed("down"):
		input.y -= 1

	if Input.is_action_pressed("right"):
		input.x += 1

	if Input.is_action_pressed("left"):
		input.x -= 1

	input = input.normalized()
	
	if Input.is_action_just_pressed("left_click"):
		if heldObject:
			heldObject.freeze = false
			heldObject.collision_mask = 1
			heldObject = null
		else:
			if raycast.get_collider():
				heldObject = raycast.get_collider()
				heldObject.freeze = true
				heldObject.collision_mask = 0
	if heldObject:
		heldObject.global_position = holdPosition.global_position
			
	

	
	var basis: Basis = camera.global_transform.basis

	_dir = Vector3.ZERO
	_dir += -basis.z * input.y
	_dir += basis.x * input.x
	_dir = _dir.normalized()

	var target_velocity = _dir * walk_speed

	var acc = Vector3(
		velocity.x,
		0,
		velocity.z
	).lerp(
		Vector3(target_velocity.x, 0, target_velocity.z),
		acceleration_speed * delta
	)

	velocity.x = acc.x
	velocity.z = acc.z

	move_and_slide()
