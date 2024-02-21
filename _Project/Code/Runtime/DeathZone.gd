class_name DeathZone extends Area3D

@export var spawnBall : SpawnBall

func _on_body_entered(body):
	print(body.is_in_group("Ball"))
	if not body.is_in_group("Ball"): 
		return
	
	spawnBall.spawnNewBall()
