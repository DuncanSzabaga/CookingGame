extends CharacterBody3D
class_name Customer
@onready var body: MeshInstance3D = $Body
@onready var head: MeshInstance3D = $Body/Head


var menuItem
var order = []
var speed = 3
var targetPos: Vector3
var hasTarget = false
signal orderTaken(customer)
var orderWasTaken = false
var orderShown = false
var material = StandardMaterial3D.new()
var color: Color = Color.WHITE

func _ready() -> void:
	color = Colors.get_color()
	material.albedo_color = color
	head.material_override = material
	body.material_override = material
	
	menuItem = Meal.menuList.pick_random()
	order = menuItem["order"]
	var text = ""
	for item in order:
		text += Food.FOOD_TYPES.keys()[item] + " "
		pass
	$Label3D.text = text
	
func interact():
	if not orderShown:
		print("Showing order")
		orderShown = true
		$Label3D.visible = true
	elif not orderWasTaken:
		Colors.release_color(color)
		print("Walking away")
		orderWasTaken = true
		orderTaken.emit(self)


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
