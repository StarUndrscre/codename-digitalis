extends Node2D

var columnX = 1156/2
var columnY = 560
@export var bpm: float = 150
@export var scroll_speed: float = 1
var crotchet
var song_pos
var beat
var global_offset = 0.2
@export var song_offset = 0.029
@export var notes = {}
var note_instances = []
const note_scene = preload("res://Note.tscn");


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	crotchet = 60 / bpm;
	for beat in notes:
		var note_inst = note_scene.instantiate()
		note_inst.beat = beat;
		note_inst.column = notes[beat];
		note_instances.append(note_inst);
		add_child(note_inst)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	song_pos = $Song.get_playback_position() + AudioServer.get_time_since_last_mix()
	# Compensate for output latency.
	song_pos = song_pos - AudioServer.get_output_latency() + song_offset;
	beat = (song_pos / crotchet) + 1;
	for note in note_instances:
		note.position.x = columnX
		note.position.y = columnY - ((note.beat - beat)*100)*scroll_speed

func _on_button_pressed():
	$Song.play()
