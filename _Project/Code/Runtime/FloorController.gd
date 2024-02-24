class_name FloorController extends Node

var input : Vector3

@export var maxAngle : float = 0.2
@export var angularSpeed : float = 1

@export var floorInstance : MeshInstance3D

var previousXDirection : int = 0
var previousZDirection : int = 0

var jumpPreviousX : bool = false
var jumpPreviousZ : bool = false

func _process(delta : float):
	if not floorInstance:
		return
	input = Vector3.ZERO
	input.x = Input.get_axis("back", "forward")
	input.z = Input.get_axis("left", "right")

	tryResetRotation()
	floorInstance.rotation = buildTargetPosition(delta)
	tryUpdatePreviousDirections()

func tryResetRotation():
	jumpPreviousX = false
	jumpPreviousZ = false

	if input.x == 0 and floorInstance.rotation.x != 0:
		jumpPreviousX = true
		input.x = -previousXDirection
		
	if input.z == 0 and floorInstance.rotation.z != 0:
		jumpPreviousZ = true
		input.z = -previousZDirection

func buildTargetPosition(delta : float) -> Vector3:
	var angle = -(input * delta * angularSpeed)
	angle += floorInstance.rotation
	
	var targetX = Math.MinMax(angle.x, -maxAngle, maxAngle)
	var targetZ = Math.MinMax(angle.z, -maxAngle, maxAngle)

	if jumpPreviousX and ((previousXDirection > 0 and targetX > 0) or (previousXDirection < 0 and targetX < 0)):
		targetX = floorInstance.rotation.x
		
	if jumpPreviousZ and ((previousZDirection > 0 and targetZ > 0) or (previousZDirection < 0 and targetZ < 0)):
		targetZ = floorInstance.rotation.z
	
	return Vector3(targetX, 0, targetZ)

func tryUpdatePreviousDirections():
	if input.x != 0 and not jumpPreviousX:
		previousXDirection = input.x

	if input.z != 0 and not jumpPreviousZ:
		previousZDirection = input.z
