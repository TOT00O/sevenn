extends CharacterBody2D

var speed = 60
var player_chase = false
var player = null

var health = 100
var player_inactack_zone = false

func _physics_process(_delta):
	
	deal_with_dmg()
	
	if player_chase:
		position += (player.position - position)/speed
		
		$AnimatedSprite2D.play("walk")
		
		if(player.position.x - position.x) < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.play("idle")



func _on_detection_area_body_entered(body):
	player = body
	player_chase = true
	

func _on_detection_area_body_exited(_body):
	player = null
	player_chase = false

func betterenemy():
	pass


func _on_enemy_hitbox_body_entered(body):
	if body.has_method("player"):
		player_inactack_zone = true


func _on_enemy_hitbox_body_exited(body):
	if body.has_method("player"):
		player_inactack_zone = false
		
func deal_with_dmg():
	if player_inactack_zone and game.player_current_attach == true:
		health = health - 20
		print(health)
		if health<= 0:
			self.queue_free()
