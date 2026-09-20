extends Node
class_name Tas

@export var bund: TextureRect
@export var slot: Panel
@export var utama: Utama
var sentuh := false
var ofset

signal kena
signal tidak_kena

func _input(kejadian: InputEvent) -> void:
	if kejadian is InputEventScreenTouch:
		if kejadian.pressed:
			#if utama and bund and utama.status == utama.Status.PERSIAPAN:
				var data = bund.get_global_rect()
				if data.has_point(bund.get_global_mouse_position()):
					sentuh = true
					ofset = bund.position - bund.get_global_mouse_position()
					get_viewport().set_input_as_handled()
		else:
			sentuh = false
			if bund and slot:
				var posisi_tengah_slot = slot.global_position + slot.size/2
				pass
				if bund.get_global_rect().has_point(posisi_tengah_slot):
					bund.global_position = posisi_tengah_slot - slot.size/2
					kena.emit()
					pass
				else:
					tidak_kena.emit()
					pass

	elif kejadian is InputEventScreenDrag:
		if bund and sentuh:
			bund.position = bund.get_global_mouse_position() + ofset
