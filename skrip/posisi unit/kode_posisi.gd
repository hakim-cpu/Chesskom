extends Node
@export var target: Area2D
@export var posisi_awal: Marker2D
@export var muncul: Marker2D
@export var kamera: Camera2D
@export var utama: Node2D

func _process(delta: float) -> void:
	if target and posisi_awal and muncul and kamera and utama:
		if utama.mulai:
			if kamera.pindah_kamera:
				target.global_position = muncul.global_position
			else:
				target.global_position = posisi_awal.global_position
		else:
			target.global_position = posisi_awal.global_position
