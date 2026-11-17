extends Node3D
@export var customer_scene: PackedScene
@onready var spawnPoint = $spawnPoint
@onready var waitTime = $waitTime
@onready var windowPoint = $customerWindowPoint
@onready var waitingArea = $customerWaitingArea
@onready var dayTimer = $dayTimer
@onready var dayClock = $clockCanvas/dayClock
var activeOrders = []
func _ready() -> void:
	waitTime.timeout.connect(spawnCustomer)
	dayTimer.timeout.connect(endDay) 
	spawnCustomer() 

func _process(delta: float) -> void:
	var secondsLeft = int(dayTimer.time_left)
	var minutes = secondsLeft / 60
	var seconds = secondsLeft % 60
	dayClock.text = "Time left: " + str(minutes) + ":" + str(seconds)
	
func endDay():
	waitTime.stop()
	
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
