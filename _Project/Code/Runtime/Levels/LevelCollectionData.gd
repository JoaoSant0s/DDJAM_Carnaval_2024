class_name LevelCollectionData extends Resource

@export var levels : Array[String] = []

var levelsAmount:
	get:
		return levels.size()
