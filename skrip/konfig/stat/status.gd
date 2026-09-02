extends Node

@export var target: Node
@export var ras: Ras
@export var bundle: Bundle
@onready var darah = %darah
@onready var stamina = %stamina
@onready var BarDarah = %"Bar Darah"
@onready var BarStamina = %"Bar Stamina"
@onready var fisik = %fisik
@onready var sihir = %sihir

func _ready() -> void:
	if target and target.ras:
		ras = target.ras

func _process(delta: float) -> void:
	#if not target and not target.bundle:
		#return
	if target and target.bundle:
		bundle = target.bundle

	if target.ras and target.bundle:
		fisik.text = "👊" + str(ras.base_fisik * bundle.bonus_fisik)
		sihir.text = "🔱" + str(ras.base_sihir * bundle.bonus_sihir)

	elif target.ras:
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
