extends Node

var finished = false

func _ready():
	finished = false

func _process(delta):
	if $RichTextLabel.visible_ratio < 1:
		$RichTextLabel.visible_ratio += 0.05 * delta
	elif not finished:
		finished = true
		start_scene_transition()

func start_scene_transition():
	# Wait 2 seconds after text finishes, then fade to black
	await get_tree().create_timer(2.0).timeout
	fade_to_black()
	# Wait for fade to complete, then switch scene
	await get_tree().create_timer(1.0).timeout  # Match this to your fade duration
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func fade_to_black():
	# Create a ColorRect that covers the entire screen
	var fade_rect = ColorRect.new()
	fade_rect.size = get_viewport().size
	fade_rect.color = Color.BLACK
	fade_rect.modulate.a = 0  # Start transparent
	fade_rect.z_index = 1000  # Make sure it's on top of everything
	add_child(fade_rect)
	
	# Animate fade to black
	var tween = create_tween()
	tween.tween_property(fade_rect, "modulate:a", 1.0, 1.0)  # Fade to opaque over 1 second
