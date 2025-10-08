extends Control


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $RichTextLabel.visible_ratio < 1:
		$RichTextLabel.visible_ratio += 0.1 * delta
	
