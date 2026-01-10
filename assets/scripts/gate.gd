extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var player: CharacterBody2D = get_parent().get_node("Player")
@onready var level_completed_animation: AnimationPlayer = $"../Player/Camera2D/LevelCompleted/AnimationPlayer"
@onready var level_completed: Area2D = $"../Player/Camera2D/LevelCompleted"

func _on_body_entered(body: Node2D) -> void:
	if Global.key_collected:
		Global.level_completed = true
		animated_sprite_2d.play("open")
		Global.level += 1


func _on_animated_sprite_2d_animation_finished() -> void:
	#player.get_node("AnimationPlayer").play("fade_out")
	level_completed.visible = true
	level_completed_animation.play("fade_in")
