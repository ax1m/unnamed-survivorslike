extends Node

var score = 0

@onready var score_label: Label = $"../Player/UI/Score"

func add_score(inc):
	score += inc
	score_label.text = str(score)
