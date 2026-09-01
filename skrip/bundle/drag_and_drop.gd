extends Node

@export var my: TextureRect
@export var slot: Control
var sentuh := false
var ofset

func _input(kejadian: InputEvent) -> void:
	if kejadian is InputEventScreenTouch:
		if my and kejadian.pressed:
			var data = my.get_global_rect()
			if data.has_point(my.get_global_mouse_position()):
				sentuh = true
				ofset = my.position - my.get_global_mouse_position()
		else:
			sentuh = false
			
			if slot:
				var data = my.get_global_rect()
				if data.has_point(slot.position):
					my.position = slot.position

	elif kejadian is InputEventScreenDrag:
		if my and sentuh:
			my.position = my.get_global_mouse_position() + ofset
