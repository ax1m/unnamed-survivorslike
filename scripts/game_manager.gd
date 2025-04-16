extends Node


var score = 0

@onready var game: Node2D = $".."
@onready var player: CharacterBody2D = $"../Player"
@onready var score_label: Label = $"../Player/UI/Score"
@onready var restart_timer: Timer = $RestartTimer
@onready var deth_label: Label = $"../Player/UI/Deth"


func add_score(inc) -> void:
	score += inc
	score_label.text = str(score)

func deth() -> void:
		deth_label.visible = true
		Engine.time_scale = 0.5
		player.set_physics_process(false)
		restart_timer.start()

func _on_timer_timeout() -> void:
	print("timeout")
	game.restart()
