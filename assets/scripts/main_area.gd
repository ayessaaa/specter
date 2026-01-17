extends Node2D
@onready var level_1: Node2D = $Level1
@onready var level_2: Node2D = $Level2
@onready var lvl1_camera: Camera2D = $Level1/Player/Camera2D
@onready var levels: Node2D = $Levels
const LEVEL_1 = preload("res://assets/areas/level_1.tscn")
const LEVEL_2 = preload("res://assets/areas/level_2.tscn")
const LEVEL_3 = preload("res://assets/areas/level_3.tscn")
const LEVEL_4 = preload("res://assets/areas/level_4.tscn")
const LEVEL_5 = preload("res://assets/areas/level_5.tscn")
@onready var animation_player: AnimationPlayer = $AnimationPlayer
const LEVELS_SCREEN = preload("res://assets/areas/levels_screen.tscn")
@onready var screens: Node2D = $Screens
const TITLE_SCREEN = preload("res://assets/areas/title_screen.tscn")
const SETTINGS_SCREEN = preload("res://assets/areas/settings_screen.tscn")
const CREDITS_SCREEN = preload("res://assets/areas/credits_screen.tscn")



var levels_array = [LEVEL_1, LEVEL_2, LEVEL_3, LEVEL_4, LEVEL_5]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#lvl1_camera.make_current()
	#var lvl = levels_array[Global.level-1].instantiate()
	#levels.add_child(lvl)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("esc") or Global.back_to_title:
		print("menu")
		if Global.title_screen:
			print(Global.title_screen)
			Global.back_to_title = false
			var screen = TITLE_SCREEN.instantiate()
			add_child(screen)
			for child in levels.get_children():
				child.queue_free()
			for child in screens.get_children():
				child.queue_free()
			Global.in_game = false
			Global.title_screen = true
			restart_global()
		
	if Global.level_completed:
		if Input.is_action_just_pressed("enter"):
			animation_player.play("blackin")
			
	if Global.go_to_levels:
		Global.go_to_levels = false
		var screen = LEVELS_SCREEN.instantiate()
		add_child(screen)
		for child in levels.get_children():
			child.queue_free()
		for child in screens.get_children():
			child.queue_free()
		Global.in_game = false
			
			
	if Global.restart_lvl:
		Global.restart_lvl = false
		print(Global.level)
		print(get_child(0))
		levels.get_child(0).queue_free()
		var lvl = levels_array[Global.level-1].instantiate()
		levels.add_child(lvl)
		
	if Global.play_pressed:
		var lvl = levels_array[Global.level-1].instantiate()
		levels.add_child(lvl)
		Global.play_pressed = false
		
	if Global.levels_pressed:
		var screen = LEVELS_SCREEN.instantiate()
		screens.add_child(screen)
		Global.levels_pressed = false
		
	if Global.settings_pressed:
		var screen = SETTINGS_SCREEN.instantiate()
		screens.add_child(screen)
		Global.settings_pressed = false
		
	if Global.credits_pressed:
		var screen = CREDITS_SCREEN.instantiate()
		screens.add_child(screen)
		Global.credits_pressed = false
		


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "blackin":
		Global.deaths = 0
		Global.lvl_stopwatch = 0.0
		Global.last_key_pos = null
		Global.position_array = []
		Global.position_array_current = []
		Global.direction_array = []
		Global.direction_array_current = []
		
		var lvl = levels_array[Global.level-1].instantiate()
		levels.add_child(lvl)
		levels.get_child(0).queue_free()
		
		animation_player.play("blackout")
		Global.level_completed = false
		
func restart_global():
	Global.dead = false
	Global.key_collected = false
	Global.level_completed = false
	Global.restart_lvl = false
	Global.deaths = 0
	Global.lvl_stopwatch = 0.0
	Global.position_array = []
	Global.position_array_current = []
	Global.direction_array = []
	Global.direction_array_current = []
	Global.last_key_pos = null
	Global.play_pressed = false
	Global.levels_pressed = false
	Global.settings_pressed = false
	Global.credits_pressed = false
	Global.second_text = false
	Global.select_sfx = false
	Global.back_to_title = false
		
	
