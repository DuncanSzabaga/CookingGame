extends Node3D
@export var customer_scene: PackedScene
@onready var spawnPoint = $spawnPoint
@onready var waitTime = $waitTime
@onready var windowPoint = $customerWindowPoint
func _ready() -> void:
	waitTime.timeout.connect(spawnCustomer)
	spawnCustomer() 


func spawnCustomer() -> void:
	var customer = customer_scene.instantiate()
	add_child(customer)
	customer.global_position = spawnPoint.global_position
	customer.walkToWindow(windowPoint.global_position)
