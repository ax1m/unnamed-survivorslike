extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $Sprite2D/AnimationPlayer
@onready var collision_shape: CollisionShape2D = $Sprite2D/Hitbox/CollisionShape2D


func _on_cooldown_timeout() -> void:
	sprite_2d.visible = true
	collision_shape.disabled = false
	animation_player.play("swing")


func _on_hitbox_body_entered(body: Node2D) -> void:
	body.die()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	sprite_2d.visible = false
	collision_shape.disabled = true
