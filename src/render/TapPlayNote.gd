class_name TapPlayNote
extends PlayNote

@export var column: NoteColumn

func process_note(conductor: Conductor, beat: float):
	self.position.x = conductor.columnX[self.column]
	self.position.y = conductor.columnY - (self.beat - beat)

func OnHit(conductor: Conductor, column_hit: NoteColumn, beat: float, song_pos: float) -> ActionResult:
	return ActionResult.Pass()
