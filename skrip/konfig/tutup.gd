extends Node
@export var canvas: CanvasLayer
var tutup = false

func _process(delta: float) -> void:
	if tutup and canvas:
		canvas.visible = false

	elif not tutup and canvas:
		canvas.visible = true


func _on_tutup_2_pressed() -> void:
	tutup = not tutup

func _on_tutup_2_released() -> void:
	pass
