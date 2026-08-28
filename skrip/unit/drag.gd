class_name Drag
extends Node

@export var target: Area2D
@export var utama: Node2D
@export var arena: Node2D
var sentuh := false
var ofset
var awal: Vector2

var grid_tersentuh: Area2D = null
signal kena

func _ready() -> void:
	pass

func _on_unit_input_event(viewport: Node, kejadian: InputEvent, shape_idx: int) -> void:
	if kejadian is InputEventScreenTouch:
		if kejadian.pressed:
			ofset = target.global_position - target.get_global_mouse_position()
			sentuh = true
			get_viewport().set_input_as_handled()
		else:
			sentuh = false
			if grid_tersentuh:
				target.global_position = grid_tersentuh.global_position - Vector2(16, 16)

func _input(kejadian: InputEvent) -> void:
	if kejadian is InputEventScreenDrag:
		if sentuh and utama:
			if utama.status == "persiapan":
				target.position = target.get_global_mouse_position() + ofset

func _on_unit_area_entered(area: Area2D) -> void:
	grid_tersentuh = area

func _on_unit_area_exited(_area: Area2D) -> void:
	pass # Replace with function body.
