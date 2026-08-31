extends Node

@export var ras: Ras
@onready var darah = %darah
@onready var stamina = %stamina
@onready var BarDarah = %"Bar Darah"
@onready var BarStamina = %"Bar Stamina"

func _process(delta: float) -> void:
	if ras:
		BarDarah.max_value = ras.maks_darah
		BarDarah.value = remap(ras.darah, 0, ras.maks_darah, 0, BarDarah.max_value)

		BarStamina.max_value = ras.maks_stamina
		BarStamina.value = remap(ras.stamina, 0, ras.maks_stamina, 0, BarStamina.max_value)

		ras.darah -= 0.1
		darah.text = str(round(ras.darah), "/", ras.maks_darah)
		stamina.text = str(ras.stamina, "/", ras.maks_stamina)
