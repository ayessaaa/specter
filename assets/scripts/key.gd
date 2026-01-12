extends Area2D
@onready var player: CharacterBody2D = get_parent().get_node("Player")
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var key_collect_sfx: AudioStreamPlayer2D = $KeyCollectSFX
@onready var sparkles: AnimatedSprite2D = $Sparkles

var follow_player = false
const SPEED = 10.0

func _process(delta: float) -> void:
	if follow_player:
		
		if player.current_dir == 1:
			position = lerp(position, Vector2(player.position.x-7, player.position.y-5), SPEED * delta)
		elif player.current_dir == -1:
			position = lerp(position, Vector2(player.position.x+7, player.position.y-5), SPEED * delta)
		
func _on_body_entered(body: Node2D) -> void:
	if !Global.key_collected:
		sparkles.visible = true
		key_collect_sfx.play()
		sparkles.play()
	follow_player = true
	Global.key_collected = true
	animated_sprite_2d.stop()
