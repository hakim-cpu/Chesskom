extends Node
@export var canvas: CanvasLayer
var tutup = true

func _process(delta: float) -> void:
	if tutup and canvas:
		canvas.hide()

	elif not tutup and canvas:
		canvas.show()


func _on_tutup_2_pressed() -> void:
	tutup = not tutup

func _on_tutup_2_released() -> void:
	pass
