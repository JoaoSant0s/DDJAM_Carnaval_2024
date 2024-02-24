class_name Teleport extends Node3D

@export var collisionArea : Area3D
var collided : bool

func _ready():
	collisionArea.body_entered.connect(_trigger_platform)

func _trigger_platform(body : Node3D):
	if not body.is_in_group("Ball"): return	
	print(body)
	#if collided:
		#return
#
	#collided = true
	#if is_instance_valid(self):
		#queue_free()
