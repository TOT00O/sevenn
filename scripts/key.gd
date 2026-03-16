extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	if self.name in Global.key_found:
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	Global.key_found.append(self.name)
	get_parent().key_collect()
	queue_free()
