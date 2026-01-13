extends Node2D
@onready var level_1: Node2D = $Level1
@onready var level_2: Node2D = $Level2
@onready var lvl1_camera: Camera2D = $Level1/Player/Camera2D
@onready var levels: Node2D = $Levels
const LEVEL_1 = preload("res://assets/areas/level_1.tscn")
const LEVEL_2 = preload("res://assets/areas/level_2.tscn")
const LEVEL_3 = preload("res://assets/areas/level_3.tscn")
@onready var animation_player: AnimationPlayer = $AnimationPlayer


var levels_array = [LEVEL_1, LEVEL_2, LEVEL_3]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#lvl1_camera.make_current()
	#var lvl = levels_array[Global.level-1].instantiate()
	#levels.add_child(lvl)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.level_completed:
		if Input.is_action_just_pressed("enter"):
			animation_player.play("blackin")
			
			
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
		
	
