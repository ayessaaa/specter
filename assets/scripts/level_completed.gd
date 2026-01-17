extends Area2D
@onready var level: Label = $Level

func _process(delta: float) -> void:
	level.text = "Level " + str(Global.level-1)


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	Global.level_completed = true
	
	
