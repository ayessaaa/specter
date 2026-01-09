extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var player: CharacterBody2D = get_parent().get_node("Player")

func _on_body_entered(body: Node2D) -> void:
	if Global.key_collected:
		animated_sprite_2d.play("open")


#func _on_animated_sprite_2d_animation_finished() -> void:
	#player.get_node("AnimationPlayer").play("fade_out")
