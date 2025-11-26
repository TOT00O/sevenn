extends CharacterBody2D

var max_speed = 60
var lala = 20 

@onready var animated_sprite = $AnimatedSprite2D

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
		# Store a normalized direction (prioritizing horizontal over vertical)
		last_direction = get_primary_direction(direction)
		play_walk_animation(direction)
	else:
		# If not moving, play idle animation based on last direction
		play_idle_animation(last_direction)

func get_primary_direction(direction: Vector2) -> Vector2:
	# Convert diagonal movement to primary directions
	if abs(direction.x) > abs(direction.y):
		# Prioritize horizontal
		return Vector2(sign(direction.x), 0)
	else:
		# Prioritize vertical
		return Vector2(0, sign(direction.y))

func play_walk_animation(direction: Vector2):
	# Determine which walk animation to play based on primary direction
	var primary_direction = get_primary_direction(direction)
	
	if primary_direction.x != 0:
		# Moving horizontally
		if primary_direction.x > 0:
			animated_sprite.play("walk_right")
		else:
			animated_sprite.play("walk_left")
	else:
		# Moving vertically
		if primary_direction.y > 0:
			animated_sprite.play("walk_down")
		else:
			animated_sprite.play("walk_up")

func play_idle_animation(direction: Vector2):
	# Determine which idle animation to play based on last direction
	if direction.x != 0:
		# Facing horizontally
		if direction.x > 0:
			animated_sprite.play("idle_right")
		else:
			animated_sprite.play("idle_left")
	else:
		# Facing vertically
		if direction.y > 0:
			animated_sprite.play("idle_down")
		else:
			animated_sprite.play("idle_up")
			
			
func collect(item):
	inv.insert(item)
