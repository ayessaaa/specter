extends Node2D
@onready var player: CharacterBody2D = $Player


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_spikes_body_entered(body: Node2D) -> void:
	player.get_node("AnimatedSprite2D").play("dead")
	Global.dead = true
