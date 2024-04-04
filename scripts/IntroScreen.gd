extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var random = RandomNumberGenerator.new()
	random.randomize()
	var music_choice = random.randi_range(0, 1)
	
	var music
	if music_choice == 0:
		music = preload("res://scenes/bgmscenes/beforetheend.tscn")
	elif music_choice == 1:
		music = preload("res://scenes/bgmscenes/aftertheend.tscn")
	
	var instance = music.instantiate()
	add_child(instance)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
