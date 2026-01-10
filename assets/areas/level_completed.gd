extends Area2D



func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	Global.level_completed = true
	Global.level += 1
