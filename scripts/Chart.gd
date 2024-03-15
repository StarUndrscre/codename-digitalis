extends Resource
class_name Chart

enum Difficulty {
	EASY,
	NORMAL,
	HARD,
	CHALLENGE
}

@export var charter: String
@export var offset: float
@export var bpm: float
@export var length: float
@export var difficulty: Difficulty
@export var rating: float
@export var notes: Array
