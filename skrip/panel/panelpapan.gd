extends TileMapLayer
var sisi := 32
var jumlah_kolom := 6
var jumlah_baris := 7
var semua_petak := []
#---node lain---
@export var cahaya: TileMapLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for baris in range(jumlah_baris):
		for kolom in range(jumlah_kolom):
			var petak = Panel.new()
			petak.size = Vector2(sisi, sisi)
			
			var posisi_x = kolom * sisi
			var posisi_y = baris * sisi
			
			petak.position = Vector2(posisi_x, posisi_y)
			
			add_child(petak)
			
			semua_petak.append(petak)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
