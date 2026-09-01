extends Node

var sisi := 32
var jumlah_kolom := 1
var jumlah_baris := 2

var daftar_kantong: Array

func _ready() -> void:
	for baris in range(jumlah_baris):
		for kolom in range(jumlah_kolom):
			var kantong = Panel.new()
			
			var posisi_x = kolom * sisi
			var posisi_y = baris * sisi
			
			kantong.position = Vector2(posisi_x, posisi_y)
			
			kantong.size = Vector2(sisi, sisi)
			
			add_child(kantong)
			
			daftar_kantong.append(kantong)
	pass
