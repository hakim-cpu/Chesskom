extends Camera2D
@export var target: Marker2D
@export var target2: Marker2D
@export var utama: Node2D
var pindah_kamera := true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not pindah_kamera and target:
		position = target.position
		
	elif pindah_kamera and target2:
		position = target2.position


func _on_ganti_kamera_button_down() -> void:
	if utama:
		if utama.status == "persiapan":
			pindah_kamera = not pindah_kamera
	#print(pindah_kamera)
