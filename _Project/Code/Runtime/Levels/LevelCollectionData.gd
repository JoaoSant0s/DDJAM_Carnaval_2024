class_name LevelCollectionData extends Resource

@export var startLevelIndex : int
@export var levels : Array[String] = []

var levelsAmount:
	get:
		return levels.size()
