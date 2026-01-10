extends Node2D
@onready var level_1: Node2D = $Level1
@onready var level_2: Node2D = $Level2
@onready var lvl1_camera: Camera2D = $Level1/Player/Camera2D
@onready var levels: Node2D = $Levels
const LEVEL_1 = preload("uid://vafip83jovvm")
const LEVEL_2 = preload("uid://cjx1iye3r2irn")

var levels_array = [LEVEL_1, LEVEL_2]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#lvl1_camera.make_current()
	var lvl = levels_array[Global.level-1].instantiate()
	levels.add_child(lvl)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.level_completed:
		if Input.is_action_just_pressed("boost"):
			var lvl_2 = LEVEL_2.instantiate()
			levels.add_child(lvl_2)
			levels.get_child(0).queue_free()
			Global.level_completed = false
	if Global.restart_lvl:
		Global.restart_lvl = false
		print(Global.level)
		print(get_child(0))
		levels.get_child(0).queue_free()
		var lvl = levels_array[Global.level-1].instantiate()
		levels.add_child(lvl)
