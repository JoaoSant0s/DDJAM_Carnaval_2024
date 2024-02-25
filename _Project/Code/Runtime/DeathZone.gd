class_name DeathZone extends Area3D

func _on_body_entered(body):
	if not body.is_in_group("Ball"): 
		return
	LevelSignals.onRespawnBall.emit()
