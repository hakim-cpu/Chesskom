extends Node

@export var pertarungan: Pertarungan
@export var ras: Ras
@export var bundle: Bundle
@onready var darah = %darah
@onready var stamina = %stamina
@onready var BarDarah = %"Bar Darah"
@onready var BarStamina = %"Bar Stamina"
@onready var fisik = %fisik
@onready var sihir = %sihir

func _ready() -> void:
	if pertarungan:
		ras = pertarungan.ras
		print (pertarungan.ras)

func _process(delta: float) -> void:
	#if not target and not target.bundle:
		#return
	if pertarungan and pertarungan.bundle:
		bundle = pertarungan.bundle

	if pertarungan and pertarungan.ras and pertarungan.bundle:
		fisik.text = "👊" + str(ras.base_fisik * bundle.m_fisik)
		sihir.text = "🔱" + str(ras.base_sihir * bundle.m_sihir)
		
		
	elif pertarungan and pertarungan.ras:
		fisik.text = "👊" + str(ras.base_fisik)
		sihir.text = "🔱" + str(ras.base_sihir)
	if ras:
		BarDarah.max_value = ras.maks_darah
		BarDarah.value = remap(ras.darah, 0, ras.maks_darah, 0, BarDarah.max_value)

		BarStamina.max_value = ras.maks_stamina
		BarStamina.value = remap(ras.stamina, 0, ras.maks_stamina, 0, BarStamina.max_value)

		ras.darah -= 0.1
		darah.text = str(round(ras.darah), "/", ras.maks_darah)
		stamina.text = str(ras.stamina, "/", ras.maks_stamina)
		pass
