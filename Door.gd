extends StaticBody2D


func _on_area_2d_body_entered(body):
	if self.name in Global.opened_doors:
		queue_free()
	if "key" + self.name in Global.key_found:
		$AnimationPlayer.play("open")
		await $AnimationPlayer.animation_finished
		Global.opened_doors.append(self.name)
		queue_free()
	if not "key" + self.name in Global.key_found:
		$AnimationPlayer.play("closed")
