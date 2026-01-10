extends Node2D
@onready var player: CharacterBody2D = $Player
const LEVEL_2 = preload("uid://cjx1iye3r2irn")
@onready var main_area: Node2D = get_parent()


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
	pass

#func _on_spikes_body_entered(body: Node2D) -> void:
	#player.get_node("AnimatedSprite2D").play("dead")
	#Global.dead = true
