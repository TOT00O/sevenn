extends TextureProgressBar

@export var enemy: CharacterBody2D

func _ready():
	if enemy:
		max_value = enemy.health
		value = enemy.health
		
		enemy.connect("health_changed", _on_health_changed)

func _on_health_changed(new_health):
	value = new_health
