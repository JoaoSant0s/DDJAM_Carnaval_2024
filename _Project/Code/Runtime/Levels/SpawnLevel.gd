class_name SpawnLevel extends Node3D

@export var gameInput : GameInput
@export var spawnBall : SpawnBall

@export var levelsCollectionData : LevelCollectionData

@export var startLevelIndex = 0
var levelIndex : int = 0
var levelInstance : Node3D

func _ready():
	LevelSignals.onLevelCompleted.connect(_instantiateNextLevel)
	levelIndex = startLevelIndex;
	_instantiateLevel(startLevelIndex)	

func _instantiateNextLevel():
	gameInput.levelInstance = null
	_cleanLevel()
	levelIndex += 1
	levelIndex = levelIndex % levelsCollectionData.levelsAmount
	
	_instantiateLevel(levelIndex)

func _instantiateLevel(levelIndex : int):
	print("Level: ", levelIndex + 1, " / ", levelsCollectionData.levelsAmount)
	var levelPrefab = load(levelsCollectionData.levels[levelIndex])
	levelInstance = levelPrefab.instantiate()	
	add_child(levelInstance)
	gameInput.levelInstance = levelInstance
	spawnBall.spawnNewBall()

func _cleanLevel():
	if is_instance_valid(levelInstance):
		levelInstance.queue_free()
		levelInstance = null
