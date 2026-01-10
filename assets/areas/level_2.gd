extends Node2D
@onready var deaths: Label = $CanvasLayer/Deaths
@onready var minutes: Label = $CanvasLayer/Minutes
@onready var seconds: Label = $CanvasLayer/Seconds
@onready var deaths_lvl: Label = $Player/Camera2D/LevelCompleted/Deaths
@onready var time_lvl: Label = $Player/Camera2D/LevelCompleted/Time

var stopwatch = 0.0
var mins = 0
var secs = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if Global.level_completed:
		#if Input.is_action_just_pressed("boost"):
			#var lvl_2 = LEVEL_2.instantiate()
			#main_area.add_child(lvl_2)
			#queue_free()
			
	if Global.level_completed:
		deaths_lvl.text = str(Global.deaths)
		time_lvl.text = "%02d" % mins + " : " + "%02d" % secs
		return
		
	stopwatch += delta
	mins = fmod(stopwatch, 3600) / 60
	secs = fmod(stopwatch, 60)
	
	minutes.text = "%02d" % mins
	seconds.text = "%02d" % secs
	deaths.text = str(Global.deaths)
