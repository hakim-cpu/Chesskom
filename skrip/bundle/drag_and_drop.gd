extends Node

@export var bund: TextureRect
@export var slot: Panel
@export var pertarungan: Node
var sentuh := false
var ofset
var kena: bool

func _input(kejadian: InputEvent) -> void:
	if kejadian is InputEventScreenTouch:
		if bund and kejadian.pressed:
			var data = bund.get_global_rect()
			if data.has_point(bund.get_global_mouse_position()):
				sentuh = true
				ofset = bund.position - bund.get_global_mouse_position()
		else:
			sentuh = false
			if bund and slot:
				var posisi_tengah_slot = slot.global_position + slot.size/2
				pass
				if bund.get_global_rect().has_point(posisi_tengah_slot):
					kena = true
					pass
				else:
					kena = false
					pass

	elif kejadian is InputEventScreenDrag:
		if bund and sentuh:
			bund.position = bund.get_global_mouse_position() + ofset
