extends Timer

@export var target: Node
@export var utama: Utama
@export var targetposisi: KodePosisi2

func _on_timeout() -> void:
	#if target:
		#print(target.bundle)
	#if utama:
		#print(utama.status)
		
	if targetposisi:
		print(targetposisi.pindah)
	pass
