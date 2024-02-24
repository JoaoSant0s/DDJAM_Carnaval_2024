class_name SpawnTeleport extends Node3D

var teleportPrefab = preload("res://_Project/Prefabs/teleport.tscn")
@export var spawnCollectable : SpawnCollectables

func spawnTeleport():
	var instance = teleportPrefab.instantiate()
	add_child(instance)
