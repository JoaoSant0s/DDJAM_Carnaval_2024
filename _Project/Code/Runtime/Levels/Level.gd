class_name Level extends Node3D

@export var ballSpawner : SpawnBall

func _ready():
	LevelSignals.onRespawnBall.connect(spawnBall)

func spawnBall():
	ballSpawner.spawnNewBall()

func cleanBall():
	ballSpawner.tryResetLasInstance()
