extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	print(":3")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Left Lane
	if Input.is_action_pressed("left_lane_1"):
		$LeftLane1.scale = Vector2(0.9, 0.9)
	else:
		$LeftLane1.scale = Vector2(1.0, 1.0)
	
	if Input.is_action_pressed("left_lane_2"):
		$LeftLane2.scale = Vector2(0.9, 0.9)
	else:
		$LeftLane2.scale = Vector2(1.0, 1.0)
	
	if Input.is_action_pressed("left_lane_3"):
		$LeftLane3.scale = Vector2(0.9, 0.9)
	else:
		$LeftLane3.scale = Vector2(1.0, 1.0)
	
	#Right Lane
	if Input.is_action_pressed("right_lane_1"):
		$RightLane1.scale = Vector2(0.9, 0.9)
	else:
		$RightLane1.scale = Vector2(1.0, 1.0)
	
	if Input.is_action_pressed("right_lane_2"):
		$RightLane2.scale = Vector2(0.9, 0.9)
	else:
		$RightLane2.scale = Vector2(1.0, 1.0)
	
	if Input.is_action_pressed("right_lane_3"):
		$RightLane3.scale = Vector2(0.9, 0.9)
	else:
		$RightLane3.scale = Vector2(1.0, 1.0)
