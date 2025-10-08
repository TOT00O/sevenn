extends CharacterBody2D

var max_speed = 300
var lala =20 

func _physics_process(delta):
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * max_speed
	move_and_slide()
	 
