class_name RotateForever extends Node3D

@export var angleSpeed : float
@export var angleBase : Vector3

func _process(delta):
	rotation += angleBase * angleSpeed * delta
