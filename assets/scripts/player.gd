extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var current_dir = 1
@onready var timer: Timer = $Timer
@onready var boost_cooldown: AnimatedSprite2D = $"../CanvasLayer/BoostCooldown"

const SPEED = 50.0
const JUMP_VELOCITY = -120.0
const SECOND_JUMP_VELOCITY = -100.0

const ACCELERATION = 1000.0
const FRICTION = 500.0

const BOOST = 150

var jump = 0

func _ready() -> void:
	Global.dead = false
	Global.key_collected = false


func _physics_process(delta: float) -> void:
	if Global.dead:
		return
		
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jump = 0

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump += 1
		velocity.y = JUMP_VELOCITY
	elif Input.is_action_just_pressed("jump") and jump < 2:
		jump += 2
		velocity.y = SECOND_JUMP_VELOCITY


	var direction := Input.get_axis("left", "right")
	if direction != 0:
		velocity.x = move_toward(
			velocity.x,
			direction * SPEED,
			ACCELERATION * delta
		)
	else:
		velocity.x = move_toward(
			velocity.x,
			0,
			FRICTION * delta
		)
		
	if Input.is_action_just_pressed("boost") and boost_cooldown.frame == 10:
		velocity.x += BOOST * current_dir
		boost_cooldown.play("default")
		
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
		
		

	move_and_slide()


func _on_spikes_body_entered(body: Node2D) -> void:
	animated_sprite_2d.play("dead")
	Global.dead = true
	Global.deaths += 1
	print("die")


func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite_2d.animation == "dead":
		timer.start()


func _on_timer_timeout() -> void:
	Global.restart_lvl = true
	
