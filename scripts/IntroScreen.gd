extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var random = RandomNumberGenerator.new()
	random.randomize()
	var music_choice = random.randi_range(0, 1)
	
	if music_choice == 0: # before the end
		get_node("BeforeTheEnd/Loop").play()
	elif music_choice == 1: # after the end
		get_node("AfterTheEnd/Intro").play()
	
	if music_choice == 0:
		get_tree().create_tween().tween_property(get_node("Cover"), "color", Color(0.0, 0.0, 0.0, 0.0), 0.5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_after_the_end_intro_finished():
	get_tree().create_tween().tween_property(get_node("Cover"), "color", Color(1.0, 1.0, 1.0, 0.0), 0.5).from(Color(1.0, 1.0, 1.0, 1.0))
