class_name BPMChange
extends Resource

@export var beat: float
@export var bpm: float
var bps: float:
	get:
		return bpm / 60

func _init(beat: float, bpm: float):
	self.beat = beat
	self.bpm = bpm
