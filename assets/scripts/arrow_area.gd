extends Area2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_body_entered(body: Node2D) -> void:
	animation_player.play("fade_out")


func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()
