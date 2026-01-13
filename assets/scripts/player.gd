extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var current_dir = 1
@onready var timer: Timer = $Timer
@onready var boost_cooldown: AnimatedSprite2D = $"../CanvasLayer/BoostCooldown"

@onready var jump_sfx: AudioStreamPlayer2D = $JumpSFX
@onready var death_sfx: AudioStreamPlayer2D = $DeathSFX
@onready var boost_sfx: AudioStreamPlayer2D = $BoostSFX
@onready var running_sfx: AudioStreamPlayer2D = $RunningSFX
@onready var landing_sfx: AudioStreamPlayer2D = $LandingSFX
@onready var dust_left: AnimatedSprite2D = $DustLeft
@onready var dust_right: AnimatedSprite2D = $DustRight
@onready var point_light_2d: PointLight2D = $PointLight2D
@onready var light_animation: AnimationPlayer = $LightAnimation
@onready var camera_2d: Camera2D = $Camera2D

const SPEED = 50.0
const JUMP_VELOCITY = -120.0
const SECOND_JUMP_VELOCITY = -100.0

const ACCELERATION = 1000.0
const FRICTION = 500.0

const BOOST = 150

var is_boost = false
var on_spike = false

var jump = 0

func _ready() -> void:
	Global.dead = false
	Global.key_collected = false


func _physics_process(delta: float) -> void:
	
	if Global.dead:
		return
		
	if Global.level_completed:
		light_animation.play("fade_out")
		
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		if jump > 0:
			landing_sfx.play()
			jump = 0

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor() and !Global.level_completed:
		jump += 1
		velocity.y = JUMP_VELOCITY
		jump_sfx.play()
	elif Input.is_action_just_pressed("jump") and jump < 2 and !Global.level_completed:
		jump += 2
		velocity.y = SECOND_JUMP_VELOCITY
		jump_sfx.play()


	var direction := Input.get_axis("left", "right")
	if direction != 0 and !Global.level_completed:
		velocity.x = move_toward(
			velocity.x,
			direction * SPEED,
			ACCELERATION * delta
		)
		if is_on_floor(): 
			if !running_sfx.playing:
				running_sfx.play()
		else:
			running_sfx.stop()
		
	else:
		velocity.x = move_toward(
			velocity.x,
			0,
			FRICTION * delta
		)
		running_sfx.stop()
		
		
	if Input.is_action_just_pressed("boost") and boost_cooldown.frame == 10 and !Global.level_completed:
		animated_sprite_2d.play("boost")
		velocity.x += BOOST * current_dir
		boost_cooldown.play("default")
		boost_sfx.play()
		is_boost = true
		camera_2d.trigger_shake()
		
		
	if !is_boost:
		if not is_on_floor():
			animated_sprite_2d.play("jump")
		elif direction != 0:
			animated_sprite_2d.play("walking")
		else:
			animated_sprite_2d.play("idle")

	# Flip sprite
	if direction < 0:
		animated_sprite_2d.flip_h = true
		current_dir = -1
		
	elif direction > 0:
		animated_sprite_2d.flip_h = false
		current_dir = 1
		
	if on_spike and animated_sprite_2d.animation != "boost":
		animated_sprite_2d.play("dead")
		death_sfx.play()
		Global.dead = true
		Global.deaths += 1
		
	if animated_sprite_2d.animation == "walking":
		if direction < 0:
			dust_right.play("default")
		elif direction > 0:
			dust_left.play("default")
	#else:
		#dust_left.play("none")
		#dust_right.play("none")
		
		
		

	move_and_slide()


func _on_spikes_body_entered(body: Node2D) -> void:
	if animated_sprite_2d.animation != "boost":
		animated_sprite_2d.play("dead")
		death_sfx.play()
		Global.dead = true
		Global.deaths += 1
	else:
		on_spike = true

func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite_2d.animation == "dead":
		timer.start()
	elif animated_sprite_2d.animation == "boost":
		is_boost = false


func _on_timer_timeout() -> void:
	Global.restart_lvl = true
	

func _on_spikes_body_exited(body: Node2D) -> void:
	on_spike = false
	
