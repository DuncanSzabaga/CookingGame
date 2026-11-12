extends CharacterBody3D
class_name Customer

var order = [Food.FOOD_TYPES.BUN, Food.FOOD_TYPES.PATTY, Food.FOOD_TYPES.CHEESE, Food.FOOD_TYPES.BUN]
var speed := 3
var targetPos: Vector3
var hasTarget := false
func _ready() -> void:
	var text = ""
	for item in order:
		text += Food.FOOD_TYPES.keys()[item] + "\n"
		pass
	$Label3D.text = text
func show_order() -> void:
	$Label3D.visible = true

func walkToWindow (pos: Vector3) -> void:
	targetPos = pos
	hasTarget = true
	
	
	
	
	
func _physics_process(delta: float) -> void:
	if hasTarget:
		var direction = targetPos - global_position
		direction.y = 0

		if direction.length() < 0.2:
			hasTarget = false
			velocity.x = 0
			velocity.z = 0
		else:
			direction = direction.normalized()
			velocity.x = direction.x * speed
			velocity.z = direction.z * speed

	move_and_slide()
