extends Node2D

var Canvas = preload("res://scenes/key_canvas.tscn")


func _ready():
	
	
	key_collect()
	
	Global.maze = true

	
		
func enemy_killed():
	pass


	

func key_collect():
	if Global.key_found != []:
		if not has_node("key_canvas"):
			var  canvas = Canvas.instantiate()
			add_child(canvas)
		else:
			get_node("key_canvas").show_key()
			
			






func _on_tp_area_entered(area):
	get_tree().change_scene_to_file("res://scenes/fightinglvl.tscn")
