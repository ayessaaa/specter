extends Area2D
@onready var level: Label = $Level
@onready var clear: Label = $Clear

func _process(delta: float) -> void:
	
	if Global.level >= 5:
		level.text = "You finished the game"
		clear.text = "c o n g r a t s !"
	else:
		level.text = "Level " + str(Global.level-1)
		clear.text = "c l e a r !"


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	Global.level_completed = true
	
	
