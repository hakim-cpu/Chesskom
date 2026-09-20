extends Node
class_name Pertarungan

#node lain
@export var target: Area2D
@export var my: Area2D
@export var utama: Utama
@export var Bund: BundleSwordman
@export var tas: Tas
#anak
@export var BarDarah: ProgressBar
@export var BarStamina: ProgressBar
#atribut
@export var ras: Ras
@export var bundle: Bundle
var arah_kejar: Vector2

func _ready() -> void:
	if not ras:
		return
	ras.darah = ras.maks_darah
	ras.stamina = ras.maks_stamina
	
	if utama:
		tas.utama = utama
func _process(delta: float) -> void:
	if my and target and utama and BarDarah and ras and BarStamina:
		if my.visible and target.visible and utama.status == utama.Status.PERTARUNGAN:
			BarDarah.max_value = ras.maks_darah
			BarDarah.value = remap(ras.darah, 0, ras.maks_darah, 0, BarDarah.max_value)
			BarStamina.max_value = ras.maks_stamina
			BarStamina.value = remap(ras.stamina, 0, ras.maks_stamina, 0, BarStamina.max_value)

			BarDarah.show()
			BarStamina.show()

			kejar(delta)
			
		elif utama.status == utama.Status.AWAL:
			BarDarah.hide()
			BarStamina.hide()

func kejar(delta):

	if target and ras:
		arah_kejar = (target.position - my.position).normalized()
		if my.position.distance_to(target.position) >= (ras.jarak_serang):
			my.position += arah_kejar * ras.kecepatan_gerak * delta

func _on_drag_and_drop_kena() -> void:
	bundle = Bund.bundle
	pass # Replace with function body.


func _on_drag_and_drop_tidak_kena() -> void:
	bundle = null
	pass # Replace with function body.
