extends Node3D
@export var customer_scene: PackedScene
@onready var spawnPoint = $spawnPoint
@onready var waitTime = $waitTime
@onready var windowPoint = $customerWindowPoint
@onready var waitingArea = $customerWaitingArea
var activeOrders = []
func _ready() -> void:
	waitTime.timeout.connect(spawnCustomer)
	spawnCustomer() 


func spawnCustomer():
	var customer = customer_scene.instantiate()
	add_child(customer)
	customer.global_position = spawnPoint.global_position
	customer.orderTaken.connect(orderTaken)
	customer.walkTo(windowPoint.global_position)



func orderTaken(customer):
	activeOrders.append(customer)
	customer.walkTo(waitingArea.global_position)
	print("curent orders: ", activeOrders.size())
	for c in activeOrders:
		print(c.menuItem["name"], ": ", c.order)
