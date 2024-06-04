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
@export var notes = {}
var note_instances = []
const note_scene = preload("res://scn/Note.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed():
	$Song.play()
