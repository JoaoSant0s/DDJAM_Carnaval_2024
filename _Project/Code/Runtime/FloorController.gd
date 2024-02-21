class_name FloorController extends MeshInstance3D

var input : Vector3

@export var maxAngle : float = 2.9

func _process(delta):
	input = Vector3.ZERO
	
	input.x = Input.get_axis("back", "forward")
	input.z = Input.get_axis("left", "right")
	
	if input.x != 0 and input.z != 0:
		input.z = -input.z
	
	rotation = input * maxAngle
