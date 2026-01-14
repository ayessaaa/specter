extends Area2D

@onready var player = get_parent().get_parent().get_node("Player")
@onready var stone_falling_sfx: AudioStreamPlayer2D = $StoneFallingSFX
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var stone_fall_sfx: AudioStreamPlayer2D = $StoneFallSFX

#func _process(delta: float) -> void:
	##if position.y 
	#print(position.y)


func _on_dripstone_body_body_entered(body: Node) -> void:
	if body is CharacterBody2D:
		player.get_node("AnimatedSprite2D").play("dead")
		player.get_node("DeathSFX").play()
		stone_fall_sfx.play()
		Global.dead = true
		Global.deaths += 1
	if body is TileMapLayer:
		animation_player.play("fade_out")
		stone_fall_sfx.play()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
