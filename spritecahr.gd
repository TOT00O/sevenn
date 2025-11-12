
extends CharacterBody2D

var max_speed = 300
var lala = 20 

@onready var animated_sprite = $AnimatedSprite2D  # Fixed: Added $ to get node

@export var inv: Inv

# Track the last direction for idle animations
var last_direction = Vector2.DOWN

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * max_speed
	move_and_slide()
	
	# Update animations based on movement
	update_animation(direction)

func update_animation(direction: Vector2):
	# If moving, update last_direction and play walk animation
	if direction.length() > 0:
		last_direction = direction
		play_walk_animation(direction)
	else:
		# If not moving, play idle animation based on last direction
		play_idle_animation(last_direction)

func play_walk_animation(direction: Vector2):
	# Determine which walk animation to play based on direction
	if abs(direction.x) > abs(direction.y):
		# Moving primarily horizontally
		if direction.x > 0:
			animated_sprite.play("walk_right")
		else:
			animated_sprite.play("walk_left")
	else:
		# Moving primarily vertically
		if direction.y > 0:
			animated_sprite.play("walk_down")
		else:
			animated_sprite.play("walk_up")

func play_idle_animation(direction: Vector2):
	# Determine which idle animation to play based on last direction
	if abs(direction.x) > abs(direction.y):
		# Facing primarily horizontally
		if direction.x > 0:
			animated_sprite.play("idle_right")
		else:
			animated_sprite.play("idle_left")
	else:
		# Facing primarily vertically
		if direction.y > 0:
			animated_sprite.play("idle_down")
		else:
			animated_sprite.play("idle_up")

	 

