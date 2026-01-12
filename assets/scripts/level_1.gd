extends Node2D
@onready var player: CharacterBody2D = $Player
@onready var boost_cooldown: AnimatedSprite2D = $CanvasLayer/BoostCooldown
@onready var deaths: Label = $CanvasLayer/Deaths
@onready var minutes: Label = $CanvasLayer/Minutes
@onready var seconds: Label = $CanvasLayer/Seconds
@onready var deaths_lvl: Label = $Player/Camera2D/LevelCompleted/Deaths
@onready var time_lvl: Label = $Player/Camera2D/LevelCompleted/Time
@onready var cam_animation: AnimationPlayer = $CamAnimation

var stopwatch = 0.0
var mins = 0
var secs = 0

var animation_done = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.deaths == 0:
		cam_animation.play("fade_in")
		print("fadein")


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

#func _on_spikes_body_entered(body: Node2D) -> void:
	#player.get_node("AnimatedSprite2D").play("dead")
	#Global.dead = true
