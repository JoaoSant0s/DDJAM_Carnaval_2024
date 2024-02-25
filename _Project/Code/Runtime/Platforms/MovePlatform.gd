class_name MovePlatform extends MeshInstance3D

@export var moveOffset : Vector3
@export var duration : float
@export var loop : bool

var startMovement : bool

func _ready():
	_startMovement(0)

func _startMovement(value : int):
	startMovement = not startMovement

	if not startMovement and not loop:
		return

	var tween = create_tween()
	
	var nextPosition = (position + moveOffset) if startMovement else (position - moveOffset)
	tween.tween_property(self, "position", nextPosition, duration)
	
	tween.step_finished.connect(_startMovement)
