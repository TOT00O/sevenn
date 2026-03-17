extends Sprite2D

@export var on_screen_offset: Vector2 = Vector2(0.5,-0.5)
@export var screen_margin: float = 4.0
@export var smoothing_speed: float = 8.0

var camera_node = Camera2D

func _ready():
	camera_node = get_viewport().get_camera_2d()

func _process(delta: float) -> void:
	if not camera_node:
		camera_node = get_viewport().get_camera_2d()
		return
	
	var target_global_position: Vector2 = get_parent().global_position
