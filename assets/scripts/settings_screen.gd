extends Node2D
@onready var hover_sfx: AudioStreamPlayer2D = $HoverSFX
@onready var done_label: Label = $DoneLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.settings_screen = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_master_mouse_entered() -> void:
	hover_sfx.play()


func _on_music_mouse_entered() -> void:
	hover_sfx.play()


func _on_sfx_mouse_entered() -> void:
	hover_sfx.play()


func _on_done_button_pressed() -> void:
	Global.back_to_title = true


func _on_done_button_mouse_entered() -> void:
	hover_sfx.play()
	done_label.modulate = Color(1, 1, 1)


func _on_done_button_mouse_exited() -> void:
	done_label.modulate = Color("#c0cbdc")
