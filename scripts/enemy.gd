extends CharacterBody2D

const SPEED = 40

@onready var player: CharacterBody2D = $"../../Player"
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	velocity = (player.position - position).normalized() * SPEED
	
	if velocity.x > 0:
		sprite.flip_h = false
	elif velocity.x < 0:
		sprite.flip_h = true
		
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	player.hit()

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()

func die() -> void:
	queue_free()
