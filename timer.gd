extends Control

@onready var timer = $Timer
@onready var label = $Label

var time_left = 120  # 3 minutes in seconds

func _ready():
	timer.start()
	update_label()

func _process(delta):
	if time_left > 0:
		time_left -= delta
		update_label()
	else:
		_on_timer_timeout()

func update_label():
	var minutes = int(time_left) / 60
	var seconds = int(time_left) % 60
	label.text = "%02d:%02d" % [minutes, seconds]




func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/deathscreen.tscn")
