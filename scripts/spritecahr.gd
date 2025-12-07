extends CharacterBody2D

var max_speed = 60
var lala = 20 

@export var max_health = 5
@onready var current_helth: int = max_health


@onready var animated_sprite = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer
@onready var weapon_node = $Weposn  # <-- Weapon node (Node2D that contains Area2D)

@export var inv: Inv

var last_direction = Vector2.DOWN
var attacking = false   # Track if currently attacking

func _ready():
	# Hide weapon initially
	weapon_node.visible = false
	
	# Connect the signal properly
	animation_player.animation_finished.connect(_on_animation_finished)


func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * max_speed

	# If attacking, optionally stop movement (or allow free movement)
	if not attacking:
		move_and_slide()
	else:
		move_and_slide() # you can comment this line if you want movement locked while attacking

	# --- Attack ---
	if Input.is_action_just_pressed("attack") and not attacking:
		play_attack_animation()

	# Update movement animations if not attacking
	if not attacking:
		update_animation(direction)


# ---------------- wlaking ---------------- #

func update_animation(direction: Vector2):
	if direction.length() > 0:
		last_direction = get_primary_direction(direction)
		play_walk_animation(direction)
	else:
		play_idle_animation(last_direction)

func get_primary_direction(direction: Vector2) -> Vector2:
	if abs(direction.x) > abs(direction.y):
		return Vector2(sign(direction.x), 0)
	else:
		return Vector2(0, sign(direction.y))



func play_walk_animation(direction: Vector2):
	var primary = get_primary_direction(direction)

	if primary.x != 0:
		if primary.x > 0:
			animated_sprite.play("walk_right")
		else:
			animated_sprite.play("walk_left")
	else:
		if primary.y > 0:
			animated_sprite.play("walk_down")
		else:
			animated_sprite.play("walk_up")


func play_idle_animation(direction: Vector2):
	if direction.x != 0:
		if direction.x > 0:
			animated_sprite.play("idle_right")
		else:
			animated_sprite.play("idle_left")
	else:
		if direction.y > 0:
			animated_sprite.play("idle_down")
		else:
			animated_sprite.play("idle_up")


# ------------------ ATTACK BOWOW ------------------ #

func play_attack_animation():
	attacking = true
	weapon_node.visible = true  # show weapon during attack

	if last_direction.x > 0:
		animation_player.play("swing_right")
	elif last_direction.x < 0:
		animation_player.play("swing_left")
	elif last_direction.y > 0:
		animation_player.play("swing_down")
	else:
		animation_player.play("swing_up")


# Called when any animation finishes
func _on_animation_finished(anim_name):
	# Only hide weapon if it's a swing animation
	if anim_name.begins_with("swing"):
		weapon_node.visible = false
		attacking = false


# ------------------ Inventory ------------------ #

func collect(item):
	inv.insert(item)
