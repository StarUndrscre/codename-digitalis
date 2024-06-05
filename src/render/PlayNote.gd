class_name PlayNote
extends Node2D

enum NoteColumn {
	C1,
	C2,
	C3,
	C4,
	C5,
	C6
}

enum SlamColumn {
	Left,
	Right
}

@export var beat: float

func process_note(conductor: Conductor, beat: float):
	pass

func OnHit(conductor: Conductor, column_hit: NoteColumn, beat: float, song_pos: float):
	return ActionResult.Pass()

func OnBeatTick(conductor: Conductor, beat: float, song_pos: float):
	return ActionResult.Pass()

func OnTrackedTick(conductor: Conductor, beat: float, song_pos: float):
	return ActionResult.Pass()
