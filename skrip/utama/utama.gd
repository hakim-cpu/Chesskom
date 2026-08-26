extends Node2D
var mulai := false
@export var kamera: Camera2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mulai:
		$CanvasLayer/mulai/Label.text = "jeda"
	elif not mulai:
		$CanvasLayer/mulai/Label.text = "mulai"


func _on_mulai_button_down() -> void:
	mulai = not mulai
	print(mulai)
