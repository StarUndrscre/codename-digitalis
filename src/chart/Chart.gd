class_name Chart
extends Resource

@export var offset: float
@export var initial_bpm: float
var initial_bps: float
var cached_bpms: Array[BPMChange]
@export var bpm_changes: Array[BPMChange]

var bpms: Array[BPMChange]:
	get:
		return get_bpms()

@export var stops: Array[Stop]
@export var notes: Array[Note]

func get_bpms() -> Array[BPMChange]:
	if (cached_bpms != null):
		return cached_bpms
	
	var ret: Array[BPMChange] = []
	ret.append(BPMChange.new(0, initial_bpm))
	ret.append_array(bpm_changes)
	cached_bpms = bpm_changes
	return ret
