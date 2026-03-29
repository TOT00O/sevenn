extends Node2D

var enemies_left = 4  

func _ready():
	$CharacterBody2D/Camera2D.zoom = Vector2(2, 2)
	
	$boss.visible = false  
	
	Global.maze = false

func enemy_killed():
	enemies_left -= 1
	print("Enemies left: ", enemies_left)
	
	if enemies_left <= 0:
		spawn_boss()


func spawn_boss():
	$boss.visible = true
