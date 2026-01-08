extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


const SPEED = 50.0
const JUMP_VELOCITY = -120.0
const SECOND_JUMP_VELOCITY = -100.0

const ACCELERATION = 1000.0
const FRICTION = 500.0

var jump = 0
var current_dir = 1


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
		
	if Input.is_action_just_pressed("boost"):
		velocity.x += 100 * current_dir
		
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
