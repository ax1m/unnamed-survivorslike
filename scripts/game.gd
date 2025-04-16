extends Node2D


func restart() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
