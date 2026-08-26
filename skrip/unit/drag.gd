extends Node

@export var target: Area2D
var sentuh := false
var ofset

func _on_unit_input_event(viewport: Node, kejadian: InputEvent, shape_idx: int) -> void:
	if kejadian is InputEventScreenTouch:
		if kejadian.pressed:
			ofset = target.global_position - target.get_global_mouse_position()
			sentuh = true
			print("disentuh!!")
		else:
			sentuh = false

func _input(kejadian: InputEvent) -> void:
	if kejadian is InputEventScreenDrag:
		if sentuh:
			target.position = target.get_global_mouse_position() + ofset
