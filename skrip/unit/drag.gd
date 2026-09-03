class_name Drag
extends Node

@export var target: Area2D
@export var utama: Utama
@export var grid: Grid
@export var konfig: Control
@export var status: Node
var sentuh := false
var ofset
var awal: Vector2

var grid_tersentuh: Area2D = null

func _ready() -> void:
	pass

func _on_unit_input_event(viewport: Node, kejadian: InputEvent, shape_idx: int) -> void:
	if kejadian is InputEventScreenTouch:
		if kejadian.pressed:
			ofset = target.global_position - target.get_global_mouse_position()
			sentuh = true
			if grid:
				grid.cahaya.visible = true
			if status:
				status.tutup = false
			get_viewport().set_input_as_handled()

		else:
			sentuh = false
			if grid:
				grid.cahaya.visible = false
			if grid_tersentuh:
				target.global_position = grid_tersentuh.global_position - Vector2(16, 16)

func _input(kejadian: InputEvent) -> void:
	if kejadian is InputEventScreenDrag:
		if sentuh and utama:
			if utama.status == utama.Status.PERSIAPAN:
				target.position = target.get_global_mouse_position() + ofset
				if status:
					status.tutup = true
#---cahaya----
			if grid and grid_tersentuh:
				grid.cahaya.global_position = grid_tersentuh.global_position - Vector2(16, 16)

func _on_unit_area_entered(area: Area2D) -> void:
	grid_tersentuh = area

func _on_unit_area_exited(_area: Area2D) -> void:
	grid_tersentuh = null
