class_name Utama
extends Node2D
enum Status { PERSIAPAN, MUNCUL,  AWAL,  PERTARUNGAN }
var status := Status.PERSIAPAN
@export var kamera: Camera2D
@export var timer: Node2D
