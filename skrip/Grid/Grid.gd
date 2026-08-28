class_name Grid
extends Node2D
var sisi := 32
var jumlah_kolom := 7
var jumlah_baris := 3
var daftar_grid := []
#---node lain---
@export var cahaya: TileMapLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for baris in range(jumlah_baris):
		for kolom in range(jumlah_kolom):
			var grid = Area2D.new()
			var data_grid = CollisionShape2D.new()
			
			data_grid.shape = RectangleShape2D.new()
			data_grid.shape.extents = Vector2(16, 16)
			
			var posisi_x = kolom * sisi
			var posisi_y = baris * sisi
			
			grid.position = Vector2(posisi_x, posisi_y)
			
			data_grid.z_index = 99
			
			grid.add_child(data_grid)
			add_child(grid)
			
			daftar_grid.append(grid)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
