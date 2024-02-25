class_name LevelUI extends Label

@export var levelCollectionData : LevelCollectionData

func _ready():
	LevelSignals.onLevelInitialized.connect(_refreshLevel)
	_refreshLevel(levelCollectionData.startLevelIndex + 1)

func _refreshLevel(levelValue : int):
	text = "Level {level}".format({"level": levelValue})
