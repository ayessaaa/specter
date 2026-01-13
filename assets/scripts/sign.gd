extends Area2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var sign_id = ""

func _on_body_entered(body: Node2D) -> void:
	print(self.name, " → ", animation_player.get_path())
	animation_player.play(sign_id)


func _on_body_exited(body: Node2D) -> void:
	animation_player.queue(sign_id+"_out")

#your goal is to get the key and get out, fast..
