class_name Conductor extends Node

@export var bpm : float = 100.0
@export var crochet : float;
@export var song_position : float;
@export var delta_song_pos : float;
@export var offset : float;
@export var last_hit : float;
@export var beat_number : int;
@export var bar_number : int;
var next_beat_time : float;
var next_bar_time : float;

func beats_to_seconds(b, _bpm) -> float:
	return (b * 60) / _bpm

func seconds_to_beats(s, _bpm) -> float:
	return s * (_bpm / 60)
