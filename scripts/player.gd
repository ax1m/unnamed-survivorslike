extends CharacterBody2D


const SPEED = 60.0

var hitpoints = 1

@onready var sprite = $AnimatedSprite2D
@onready var timer: Timer = $"../GameManager/Timer"
@onready var deth_label: Label = $UI/Deth

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
	
func hit() -> void:
	hitpoints -= 1
	if hitpoints == 0:
		deth_label.visible = true
		Engine.time_scale = 0.5
		set_physics_process(false)
		sprite.play("deth")
		timer.start()
	elif hitpoints > 0:
		sprite.play("hit")
	
