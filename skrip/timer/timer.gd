extends Node

@export var utama: Utama
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
	utama.status = utama.Status.MUNCUL
	$Panel/Label.visible = false
	$Panel/Label2.visible = true
	$muncul.start()

func _on_muncul_timeout() -> void:
	utama.status = utama.Status.PERTARUNGAN
	$Panel/Label2.visible = false
	$Panel/Label3.visible = true
	$pertarungan.start()

func _on_pertarungan_timeout() -> void:
	utama.status = utama.Status.AWAL
	$Panel/Label3.visible = false
	$Panel/Label4.visible = true
	$posisi_awal.start()

func _on_posisi_awal_timeout() -> void:
	utama.status = utama.Status.PERSIAPAN
	$Panel/Label4.visible = false
	$Panel/Label.visible = true
	$persiapan.start()
