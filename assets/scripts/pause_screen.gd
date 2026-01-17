extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var level: Label = $CanvasLayer/Level
@onready var resume: Label = $CanvasLayer/Resume
@onready var levels: Label = $CanvasLayer/Levels
@onready var menu: Label = $CanvasLayer/Menu
@onready var hover_sfx: AudioStreamPlayer2D = $HoverSFX
@onready var select_sfx: AudioStreamPlayer2D = $SelectSFX

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	level.text = "Level "+str(Global.level)
	if Input.is_action_just_pressed("esc") and Global.in_game:
		if !Global.pause:
			animation_player.play("fade_in")
			Global.pause = true
		else:
			animation_player.play("fade_out")
			Global.pause = false


func _on_levels_button_mouse_entered() -> void:
	hover_sfx.play()
	levels.modulate = Color(0.527,0.597,0.716)


func _on_levels_button_mouse_exited() -> void:
	levels.modulate = Color(0.258,0.328,0.456)


func _on_resume_button_mouse_entered() -> void:
	hover_sfx.play()
	resume.modulate = Color(1,1,1)


func _on_resume_button_mouse_exited() -> void:
	resume.modulate = Color(0.527,0.597,0.716)


func _on_menu_button_mouse_entered() -> void:
	hover_sfx.play()
	menu.modulate = Color(0.527,0.597,0.716)


func _on_menu_button_mouse_exited() -> void:
	menu.modulate = Color(0.258,0.328,0.456)


func _on_levels_button_pressed() -> void:
	select_sfx.play()
	animation_player.play("fade_out")
	Global.go_to_levels = true
	Global.pause = false
	get_viewport().gui_release_focus()


func _on_resume_button_pressed() -> void:
	select_sfx.play()
	animation_player.play("fade_out")
	Global.pause = false
	get_viewport().gui_release_focus()


func _on_menu_button_pressed() -> void:
	select_sfx.play()
	animation_player.play("fade_out")
	Global.back_to_title = true
	Global.pause = false
	Global.in_game = false
	get_viewport().gui_release_focus()
