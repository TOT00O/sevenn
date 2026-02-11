extends CharacterBody2D

var speed = 60
var player_chase = false
var player = null

var health = 100


func _physics_process(_delta):
	

	
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



		
func take_damage(amount: int):
	health -= amount
	print("Enemy health: ", health)
	
	if health <= 0:
		queue_free()
