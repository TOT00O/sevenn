extends TextureProgressBar

func _ready():
	min_value = 0

func update_health(new_health: int) -> void:
	# Clamp and convert to float
	var target = float(max(new_health, 0))
	
	# Smooth animation using tween
	var tween = create_tween()
	tween.tween_property(self, "value", target, 0.2)
