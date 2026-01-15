extends Node


## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
	

var dead = false
var key_collected = false

var level_completed = false
var level = 1
var levels_unlocked = [1]

var restart_lvl = false

var deaths = 0

var lvl_stopwatch = 0.0

var position_array = []
var position_array_current = []

var direction_array = []
var direction_array_current = []

var last_key_pos = null

var play_pressed = false
var levels_pressed = false

var second_text = false

var select_sfx = false
