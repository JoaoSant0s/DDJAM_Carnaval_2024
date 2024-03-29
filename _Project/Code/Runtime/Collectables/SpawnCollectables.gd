class_name SpawnCollectables extends Node3D

var collectablePrefab = preload("res://_Project/Prefabs/collectable.tscn")

@export var collecablePoints : Array[Node3D]
@export var spawnTeleport : SpawnTeleport

var collectablesAmount : int

func _ready():
	spawnCollectables()

func collectableCollected():
	collectablesAmount -= 1
	
	if collectablesAmount <= 0:
		spawnTeleport.spawnTeleport()

func spawnCollectables():
	collectablesAmount = collecablePoints.size()
	for point in collecablePoints:
		createCollectable(point.position)
		
func createCollectable(position : Vector3):	
		var instance : Collectable = collectablePrefab.instantiate()
		instance.onCollectableCollected.connect(collectableCollected)
		instance.position = position
		add_child(instance)
	
