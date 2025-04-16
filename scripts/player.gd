extends CharacterBody2D


const SPEED = 60.0

var hitpoints = 1

@onready var game_manager: Node = %GameManager
@onready var enemies: Node = $"../Enemies"
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:

	velocity = Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down")
		).normalized() * SPEED
	
	if velocity.x > 0:
		sprite.flip_h = false
	elif velocity.x < 0:
		sprite.flip_h = true
		
	if velocity.length() > 0:
		sprite.play("run")
	else:
		sprite.play("idle")

	move_and_slide()
	
func hit(dmg: int = 1) -> void:
	hitpoints -= dmg
	if hitpoints <= 0:
		game_manager.deth()
		sprite.play("deth")
	elif hitpoints > 0:
		sprite.play("hit")
	
func closest_enemy() -> CharacterBody2D:
	var res: CharacterBody2D = null
	var r_dist: float = INF
	for enemy: CharacterBody2D in enemies.get_children():
		var dist = (enemy.position - position).length()
		if dist < r_dist:
			res = enemy
	return res
	
func closest_enemy_pos() -> Vector2:
	var enemy: CharacterBody2D = closest_enemy()
	if enemy == null:
		return position
	else:
		return enemy.position
	
func closest_enemy_dir() -> float:
	var enemy: CharacterBody2D = closest_enemy()
	if enemy == null:
		return 0.0
	else:
		return (enemy.position - position).angle()
	
