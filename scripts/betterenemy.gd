extends CharacterBody2D

var speed = 60
var player_chase = false
var player = null

@export var health = 100
@export var max_health = 100

@onready var health_bar = $HealthBar
@onready var sprite = $AnimatedSprite2D


func _ready():
	# Setup health bar
	health_bar.max_value = max_health
	health_bar.value = health
	health_bar.visible = false  # hidden until damaged


func _physics_process(_delta):
	if player_chase and player != null:
		position += (player.position - position) / speed
		
		sprite.play("walk")
		
		if (player.position.x - position.x) < 0:
			sprite.flip_h = true
		else:
			sprite.flip_h = false
	else:
		sprite.play("idle")


func _on_detection_area_body_entered(body):
	player = body
	player_chase = true


func _on_detection_area_body_exited(_body):
	player = null
	player_chase = false


func take_damage(amount: int):
	health -= amount
	print("Enemy health: ", health)
	
	health_bar.visible = true
	health_bar.value = health
	
	if health <= 0:
		die()



func betterenemy():
	return true

func die():
	
	get_parent().enemy_killed()
	queue_free()
