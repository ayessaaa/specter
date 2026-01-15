extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var player: CharacterBody2D = get_parent().get_node("Player")
@onready var level_completed_animation: AnimationPlayer = $"../Player/Camera2D/LevelCompleted/AnimationPlayer"
@onready var level_completed: Area2D = $"../Player/Camera2D/LevelCompleted"
@onready var gate_sfx: AudioStreamPlayer2D = $GateSFX
@onready var success_sfx: AudioStreamPlayer2D = $SuccessSFX

func _on_body_entered(body: Node2D) -> void:
	if Global.key_collected:
		Global.level_completed = true
		animated_sprite_2d.play("open")
		Global.levels_unlocked.append(Global.level)
		Global.level += 1
		gate_sfx.play()
		success_sfx.play()


func _on_animated_sprite_2d_animation_finished() -> void:
	#player.get_node("AnimationPlayer").play("fade_out")
	level_completed.visible = true
	level_completed_animation.play("fade_in")
