extends Node
@export var target: Area2D
@export var awal: Marker2D
@export var muncul: Marker2D
@export var kamera: Camera2D
@export var utama: Node2D
@export var target2: Node
var pindah := false

func _process(delta: float) -> void:
	if target and muncul and kamera and utama and awal and target2:
		if utama.status == utama.Status.PERSIAPAN:
			var posisi_x = -(target.global_position.x) - 32
			var posisi_y = -(target.global_position.y) - 32
			var coba = Vector2(posisi_x, posisi_y)
			muncul.global_position = coba
			awal.global_position = target.global_position
		if utama.status == utama.Status.MUNCUL and not target2.pindah:
			if kamera.pindah_kamera:
				target.global_position = muncul.global_position
		if utama.status == utama.Status.AWAL:
			target.global_position = awal.global_position
			pindah = false
		if target.global_position == muncul.global_position:
			pindah = true
