extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func show_key():
	if "keyDoor" in Global.key_found and not "Door" in Global.opened_doors:
		$keyDoor.visible = true


func hide_key():
	if "Door" in Global.opened_doors:
		$keyDoor.visible = false
	
func delete_canvas():
	if "Door" in Global.opened_doors:
		self.queue_free()
