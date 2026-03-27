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
	
	var target_pos: Vector2 = get_parent().global_position
	var viewport_size: Vector2 = get_viewport().get_visible_rect().size * 0.2
	var viewport_center: Vector2 = viewport_size * 0.5
	
	var screen_pos: Vector2 = (target_pos - camera_node.global_position) * camera_node.zoom + viewport_center
	
	var final_pos: Vector2
	var final_rot: float
	
	if screen_pos.x >= 0 and screen_pos.x <= viewport_size.x and \
	   screen_pos.y >= 0 and screen_pos.y <= viewport_size.y:
		final_pos = target_pos + on_screen_offset
		final_rot = 0.0
	else:
		var clamped_screen_pos: Vector2 = Vector2(
			clamp(screen_pos.x, screen_margin, viewport_size.x - screen_margin),
			clamp(screen_pos.y, screen_margin, viewport_size.y - screen_margin)
		)
		
		final_pos = camera_node.global_position + (clamped_screen_pos - viewport_center) / camera_node.zoom
		
	
		var dir_to_target: Vector2 = (target_pos - final_pos).normalized()
		final_rot = dir_to_target.angle()
		
	
	global_position = lerp(global_position, final_pos, delta * smoothing_speed)
	rotation = lerp(rotation, final_rot, delta * smoothing_speed)
