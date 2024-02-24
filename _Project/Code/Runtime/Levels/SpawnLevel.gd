class_name SpawnLevel extends Node3D

@export var gameInput : GameInput

@export var levelsCollectionData : LevelCollectionData

var levelIndex : int = 0
var levelInstance : Level

func _ready():
	LevelSignals.onLevelCompleted.connect(_instantiateNextLevel)
	levelIndex = levelsCollectionData.startLevelIndex;
	_instantiateLevel(levelIndex)

func _instantiateNextLevel():
	levelIndex += 1
	levelIndex = levelIndex % levelsCollectionData.levelsAmount
	
	_instantiateLevel(levelIndex)

func _instantiateLevel(levelIndex : int):
	_cleanLevel()
	print("Level: ", levelIndex + 1, " / ", levelsCollectionData.levelsAmount)
	var levelPrefab = load(levelsCollectionData.levels[levelIndex])
	levelInstance = levelPrefab.instantiate()
	add_child(levelInstance)
	gameInput.levelInstance = levelInstance
	levelInstance.spawnBall()

func _cleanLevel():
	if levelInstance != null:
		levelInstance.cleanBall()

	gameInput.levelInstance = null

	if is_instance_valid(levelInstance):
		levelInstance.queue_free()
		levelInstance = null
