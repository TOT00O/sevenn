extends Timer

func _ready():
	$lvltimer.start()


func _on_timeout():
	print("Time's up!")
	get_tree().reload_current_scene()
