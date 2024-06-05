class_name TapNote
extends Note

enum NoteColumn {
	C1,
	C2,
	C3,
	C4,
	C5,
	C6
}

@export var column: NoteColumn
static var display: PackedScene = preload("res://scn/TapNote.tscn")

func getNoteScene() -> TapPlayNote:
	var new_display = display.instantiate() as TapPlayNote
	new_display.beat = self.beat
	new_display.column = self.column
	return new_display
