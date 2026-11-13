extends CharacterBody3D
class_name Customer

var menuItem
var order = []
var speed = 3
var targetPos: Vector3
var hasTarget = false
signal orderTaken(customer)
var orderWasTaken = false
var orderShown = false
func _ready() -> void:
	menuItem = Meal.menuList.pick_random()
	order = menuItem["order"]
	var text = ""
	for item in order:
		text += Food.FOOD_TYPES.keys()[item] + "\n"
		pass
	$Label3D.text = text
	
func interact():
	if not orderShown:
		orderShown = true
		$Label3D.visible = true
	elif not orderWasTaken:
		orderWasTaken = true
		orderTaken.emit(self)

func walkToWindow (pos: Vector3) -> void:
	targetPos = pos
	hasTarget = true
	
	
func walkTo(pos: Vector3):
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
