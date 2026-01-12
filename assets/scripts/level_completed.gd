extends Area2D



func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	Global.level_completed = true
	Global.deaths = 0
	Global.lvl_stopwatch = 0.0
	Global.last_key_pos = null
	Global.position_array = []
	Global.position_array_current = []

	Global.direction_array = []
	Global.direction_array_current = []
	
