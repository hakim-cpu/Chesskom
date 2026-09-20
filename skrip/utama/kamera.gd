extends Camera2D
class_name Kamera
@export var target: Marker2D
@export var target2: Marker2D
@export var utama: Utama
@export var jendela1: Control
@export var jendela2: Control
var pindah := true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not pindah and target:
		position = target.position
		if jendela1:
			pass
		
	elif pindah and target2:
		position = target2.position


func _on_ganti_kamera_button_down() -> void:
	if utama:
		#if utama.status == utama.Status.PERSIAPAN:
		pindah = not pindah
