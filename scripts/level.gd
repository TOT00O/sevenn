extends Node2D


func _ready():
	if NavigationManger.spawn_door_tag != null:
		_on_level_spawn(NavigationManger.spawn_door_tag)
		

func _on_level_spawn(destination_tag: String):
	var  door_path = "doors/door_" + destination_tag
	var _door = get_node(door_path) as Door
	NavigationManger.trigger_player_spawn(_door.spawn.global_position, _door.spawn.global_direction)
	
