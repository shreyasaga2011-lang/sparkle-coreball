extends Node



func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass

var currentWaves = 0 
func waveTickGlobal():
	currentWaves += 1
