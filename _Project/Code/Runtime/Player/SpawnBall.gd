class_name SpawnBall extends Node3D

var ballPrefab = preload("res://_Project/Prefabs/ball.tscn")

var ballInstance : RigidBody3D

func _tryResetLasInstance():
	if ballInstance == null or not is_instance_valid(ballInstance):
		return
	
	ballInstance.queue_free()
	ballInstance = null

func spawnNewBall():
	_tryResetLasInstance()
	
	ballInstance = ballPrefab.instantiate()
	ballInstance.position = position
	add_child(ballInstance)
