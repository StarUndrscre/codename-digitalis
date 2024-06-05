class_name Conductor
extends Node2D

class TrackedNote:
	var index: int
	var note
	var action

static var global_offset: float = 0.2
static var music_rate: float = 1.0
static var current_bpm: float
static var current_bps: float

@export var scroll_speed: float = 1
var song_pos
var beat
@export var chart: Chart
var note_instances: Array[PlayNote]
var judging_notes: Array[PlayNote]
var tracking_notes: Array[PlayNote]
var upcoming_beats: Array[PlayNote]
var current_judging_index: int = 0
var columnX: Array[float] = [-44, -22, 0, 22, 44, 66]
var columnY: float = 1920

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for note in chart.notes:
		var note_inst = note.getNoteScene()
		note_instances.append(note_inst)
		add_child(note_inst)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_node("Song").playing:
		song_pos = get_node("Song").get_playback_position() + AudioServer.get_time_since_last_mix()
	else:
		song_pos = -1
	
	#for i in note_instances:
		#var note: PlayNote = note_instances[i]
		#var note_pos: float

func _on_button_pressed():
	$Song.play()
