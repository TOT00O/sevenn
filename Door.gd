extends StaticBody2D


func _on_area_2d_body_entered(body):
	if self.name in Global.key_found:
		$AnimationPlayer.play("open")
		await $AnimationPlayer.animation_finished
		queue_free()
	if not self.name in Global.key_found:
		$AnimationPlayer.play("closed")
