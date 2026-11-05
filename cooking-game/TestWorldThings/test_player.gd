extends Node3D

@onready var forward: = $Forward
@onready var backward: = $Backward
@onready var left: = $Left
@onready var right: = $Right

func _physics_process(delta):
	if Input.is_action_pressed("forward") and collision_check(forward):
		set_physics_process(false)
		await tween_translation(get_direction(forward))
		set_physics_process(true)
	elif Input.is_action_pressed("backward") and collision_check(backward):
		set_physics_process(false)
		await tween_translation(get_direction(backward))
		set_physics_process(true)
	elif Input.is_action_pressed("left"):
		set_physics_process(false)
		await tween_rotation(PI/2)
		set_physics_process(true)
	elif Input.is_action_pressed("right"):
		set_physics_process(false)
		await tween_rotation(-PI/2)
		set_physics_process(true)
	pass
	
func collision_check(direction):
	var colliding = direction.is_colliding()
	return direction.is_colliding()

func get_direction(direction: RayCast3D):
	var dir = direction.global_transform.basis * direction.target_position.normalized()
	return dir * 2.0

func tween_translation(change):
	var tween = create_tween()
	tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.tween_property(self, "global_position", global_position + change, 0.35).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
	await tween.finished
	
func tween_rotation(change):
	var tween = create_tween()
	tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.tween_property(self, "rotation", rotation + Vector3(0, change, 0), 0.35).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
	await tween.finished
