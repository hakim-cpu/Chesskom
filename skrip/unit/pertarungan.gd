extends Node

#node lain
@export var target: Area2D
@export var my: Area2D
@export var utama: Node2D
@export var bund: TextureRect
@export var slot: Control 
#anak
@export var BarDarah: ProgressBar
@export var BarStamina: ProgressBar
#atribut
@export var ras: Ras
@export var bundle: Bundle
var arah_kejar: Vector2

func _ready() -> void:
	if ras:
		ras.darah = ras.maks_darah
		ras.stamina = ras.maks_stamina

func _process(delta: float) -> void:
	if slot and bund:
		if slot.position == bund.position:
			bundle = load("res://skrip/atribut/output/bundle/swordman.tres")
		else:
			bundle = null
	if utama and utama.status == "pertarungan":
		if BarDarah and BarStamina and my and target and my.visible and target.visible:
			BarDarah.max_value = ras.maks_darah
			BarDarah.value = remap(ras.darah, 0, ras.maks_darah, 0, BarDarah.max_value)
			BarStamina.max_value = ras.maks_stamina
			BarStamina.value = remap(ras.stamina, 0, ras.maks_stamina, 0, BarStamina.max_value)
			
			BarDarah.visible = true
			BarStamina.visible = true
			kejar(delta)

	elif BarDarah and BarStamina:
		BarDarah.visible = false
		BarStamina.visible = false

func kejar(delta):
	if target and ras and bundle:
		arah_kejar = (target.position - my.position).normalized()
		if my.position.distance_to(target.position) >= (bundle.jarak_serang * 32):
			my.position += arah_kejar * ras.kecepatan_gerak * delta
