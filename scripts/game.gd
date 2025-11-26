extends Node2D  # Attach this to the root node of your game scene

func _ready():
	fade_from_black()
	$backgroundmusic.play()

func fade_from_black():
	# Create a black ColorRect that covers the entire screen
	var fade_rect = ColorRect.new()
	fade_rect.size = get_viewport().size
	fade_rect.color = Color.BLACK
	fade_rect.modulate.a = 1.0  # Start fully black
	fade_rect.z_index = 1000  # Make sure it's on top of everything
	add_child(fade_rect)
	
	# Animate fade from black to transparent
	var tween = create_tween()
	tween.tween_property(fade_rect, "modulate:a", 0.0, 1.0)  # Fade to transparent over 1 second
	tween.tween_callback(fade_rect.queue_free)  # Remove the fade rect when done
