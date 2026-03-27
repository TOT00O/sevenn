extends Node2D

var Canvas = preload("res://scenes/key_canvas.tscn")


func _ready():
	
	if NavigationManger.spawn_door_tag != null:
		_on_level_spawn(NavigationManger.spawn_door_tag)
	
	key_collect()
	
	Global.maze = true

	
		
func enemy_killed():
	pass

func _on_level_spawn(destination_tag: String):
	var  door_path = "doors/door_" + destination_tag
	var _door = get_node(door_path) as Door
	NavigationManger.trigger_player_spawn(_door.spawn.global_position, _door.spawn.global_direction)
	

func key_collect():
	if Global.key_found != []:
		if not has_node("key_canvas"):
			var  canvas = Canvas.instantiate()
			add_child(canvas)
		else:
			get_node("key_canvas").show_key()
			
			




