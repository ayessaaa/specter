extends Node2D
@onready var deaths: Label = $CanvasLayer/Deaths
@onready var minutes: Label = $CanvasLayer/Minutes
@onready var seconds: Label = $CanvasLayer/Seconds
@onready var deaths_lvl: Label = $Player/Camera2D/LevelCompleted/Deaths
@onready var time_lvl: Label = $Player/Camera2D/LevelCompleted/Time
@onready var player: CharacterBody2D = $Player
@onready var key: Area2D = $Key
@onready var cam_animation: AnimationPlayer = $CamAnimation
@onready var select_sfx: AudioStreamPlayer2D = $Audios/SelectSFX


const GHOST = preload("res://assets/scenes/ghost.tscn")

var mins = 0
var secs = 0

var position_index = 0

var has_ghost = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.deaths == 0:
		cam_animation.play("fade_in")
	if len(Global.position_array_current) > 0:
		Global.position_array = Global.position_array_current
		Global.position_array_current = []
		Global.direction_array = Global.direction_array_current
		Global.direction_array_current = []
	if len(Global.position_array) > 0:
		var ghost = GHOST.instantiate()
		add_child(ghost)
		has_ghost = true
		
	if Global.last_key_pos != null:
		key.position = Global.last_key_pos
		print("last pos")

	Global.in_game = true
	Global.title_screen = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if Global.level_completed:
		#if Input.is_action_just_pressed("boost"):
			#var lvl_2 = LEVEL_2.instantiate()
			#main_area.add_child(lvl_2)
			#queue_free()
			
	if Global.select_sfx:
		select_sfx.play()
		Global.select_sfx = false
			
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
				get_node("Ghost").position = Global.position_array[position_index]
				if Global.direction_array[position_index] == 1:
					get_node("Ghost/AnimatedSprite2D").flip_h = false
				elif Global.direction_array[position_index] == -1:
					get_node("Ghost/AnimatedSprite2D").flip_h = true
				position_index += 1
			else:
				get_node("Ghost/AnimatedSprite2D").play("done")
				get_node("Ghost/AnimationPlayer").play("loop")
				
			Global.position_array_current.append(player.position)
			Global.direction_array_current.append(player.current_dir)
			Global.last_key_pos = key.position
		else:
			Global.position_array.append(player.position)
			Global.direction_array.append(player.current_dir)
			Global.last_key_pos = key.position
			
	
