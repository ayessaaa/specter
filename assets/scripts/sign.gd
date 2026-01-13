extends Area2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var label: Label = $Label
@export var sign_text = ""
@export var second_sign_text = ""
#@export var level = 0
@export var lines = 0
@export var second_lines = 0

# lvl 2 signs changes

func _process(delta: float) -> void:
	if !Global.second_text and Global.level == 2 and Global.deaths > 0:
		await get_tree().create_timer(2).timeout
		label.text = second_sign_text
		lines = second_lines
		Global.second_text = true
	

func _on_body_entered(body: Node2D) -> void:
	if Global.second_text and second_sign_text != "":
		label.text = second_sign_text
		animation_player.play(str(second_lines)+"_line_in")
	else:
		print("hello")
		label.text = sign_text
		animation_player.play(str(lines)+"_line_in")


func _on_body_exited(body: Node2D) -> void:
	if Global.second_text and second_sign_text != "":
		animation_player.play(str(second_lines)+"_line_out")
	else:
		animation_player.play(str(lines)+"_line_out")

#your goal is to get the key and get out, fast..
