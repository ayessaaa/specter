extends Node2D
@onready var rock_1: AnimatedSprite2D = $CanvasLayer/Rock1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_mouse_entered() -> void:
	rock_1.play("hover")


func _on_button_mouse_exited() -> void:
	rock_1.play("default")
