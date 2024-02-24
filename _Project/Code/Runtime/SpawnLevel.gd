class_name SpawnLevel extends Node3D

@export var gameInput : GameInput
@export var spawnBall : SpawnBall

var levels : Array[String] = ["res://_Project/Levels/level_1.tscn"]

func _ready():
	var levelPrefab = load(levels[0])
	var level = levelPrefab.instantiate()	
	add_child(level)
	gameInput.levelInstance = level
	spawnBall.spawnNewBall()
