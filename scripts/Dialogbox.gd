extends Control

var dialog = [
	'text lalalalallalallallalalallalalalalalallala', 
	'more text alalapojphweohfpewhph3wphrph3h32ohr3',
	'no more text'
]

var dialog_index = 0
var finished = false

func _ready():
	load_dialog()

func _process(delta):
	$"Usagi(1)".visible = finished
	if Input.is_action_just_pressed("ui_accept") and finished:
		load_dialog()

func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		$MarginContainer/RichTextLabel.text = dialog[dialog_index]
		$MarginContainer/RichTextLabel.visible_ratio = 0
		
		var tween = create_tween()
		tween.tween_property($MarginContainer/RichTextLabel, "visible_ratio", 1, 1)
		tween.finished.connect(_on_tween_finished)
		
		dialog_index += 1
	else: 
		queue_free()

func _on_tween_finished():
	finished = true

