extends Node

@export var target: Marker2D
@export var utama: Node2D
@export var drag: Node
@export var k_p: Node
@export var k_p2: Node
var detik
var detik2
var detik3
var detik4

func _process(delta: float) -> void:
	detik = ceil($persiapan.time_left)
	detik2 = ceil($muncul.time_left)
	detik3 = ceil($pertarungan.time_left)
	detik4 = ceil($posisi_awal.time_left)
	
	$Panel/Label.text = str(detik)
	$Panel/Label2.text = str(detik2)
	$Panel/Label3.text = str(detik3)
	$Panel/Label4.text = str(detik4)

func _on_persiapan_timeout() -> void:
	utama.status = "muncul"
	$Panel/Label.visible = false
	$Panel/Label2.visible = true
	$muncul.start()

func _on_muncul_timeout() -> void:
	utama.status = "pertarungan"
	$Panel/Label2.visible = false
	$Panel/Label3.visible = true
	$pertarungan.start()

func _on_pertarungan_timeout() -> void:
	utama.status = "awal"
	$Panel/Label3.visible = false
	$Panel/Label4.visible = true
	$posisi_awal.start()

func _on_posisi_awal_timeout() -> void:
	utama.status = "persiapan"
	$Panel/Label4.visible = false
	$Panel/Label.visible = true
	$persiapan.start()
