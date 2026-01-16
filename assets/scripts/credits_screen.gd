extends Node2D
@onready var hover_sfx: AudioStreamPlayer2D = $HoverSFX
@onready var done_label: Label = $Done


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_done_button_pressed() -> void:
	Global.back_to_title = true

	
func _on_done_button_mouse_entered() -> void:
	hover_sfx.play()
	done_label.modulate = Color(1, 1, 1)


func _on_done_button_mouse_exited() -> void:
	done_label.modulate = Color("#c0cbdc")
