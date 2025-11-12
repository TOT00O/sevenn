extends Control


var dialog = [
	'text', 
	'more text',
	'no moew text'
]

var dialog_index = 0
var finsihed = false

func _ready():
	load_dialog()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()
	

func load_dialog():
	if dialog_index < dialog.size():
		$MarginContainer/RichTextLabel.bbcode_text =dialog[dialog_index]
	dialog_index +=1
