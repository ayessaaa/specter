extends Node2D
@onready var deaths: Label = $CanvasLayer/Deaths
@onready var minutes: Label = $CanvasLayer/Minutes
@onready var seconds: Label = $CanvasLayer/Seconds
@onready var deaths_lvl: Label = $Player/Camera2D/LevelCompleted/Deaths
@onready var time_lvl: Label = $Player/Camera2D/LevelCompleted/Time
@onready var player: CharacterBody2D = $Player

const GHOST = preload("uid://c56psrlw6rj4r")

var mins = 0
var secs = 0

var position_index = 0

var has_ghost = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if len(Global.position_array_current) > 0:
		Global.position_array = Global.position_array_current
		Global.position_array_current = []
		Global.direction_array = Global.direction_array_current
		Global.direction_array_current = []
	if len(Global.position_array) > 0:
		var ghost = GHOST.instantiate()
		add_child(ghost)
		has_ghost = true


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
		
	Global.lvl_stopwatch += delta
	mins = fmod(Global.lvl_stopwatch, 3600) / 60
	secs = fmod(Global.lvl_stopwatch, 60)
	
	minutes.text = "%02d" % mins
	seconds.text = "%02d" % secs
	deaths.text = str(Global.deaths)
	
	if !Global.dead:
		if len(Global.position_array) > 0 and has_ghost:
			if len(Global.position_array) > position_index:
				print(len(Global.position_array))
				print(len(Global.direction_array))
				get_node("Ghost").position = Global.position_array[position_index]
				if Global.direction_array[position_index] == 1:
					get_node("Ghost/AnimatedSprite2D").flip_h = false
				elif Global.direction_array[position_index] == -1:
					get_node("Ghost/AnimatedSprite2D").flip_h = true
				position_index += 1
			else:
				get_node("Ghost/AnimatedSprite2D").play("done")
				
				
			Global.position_array_current.append(player.position)
			Global.direction_array_current.append(player.current_dir)
		else:
			Global.position_array.append(player.position)
			Global.direction_array.append(player.current_dir)
			
	
