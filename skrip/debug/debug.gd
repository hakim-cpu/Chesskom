extends Timer

@export var target: Node

func _on_timeout() -> void:
	if target:
		print(target.bundle)
	pass
