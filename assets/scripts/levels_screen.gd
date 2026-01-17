extends Node2D
@onready var rock_1: AnimatedSprite2D = $CanvasLayer/Rock1
@onready var rock_2: AnimatedSprite2D = $CanvasLayer/Rock2
@onready var rock_3: AnimatedSprite2D = $CanvasLayer/Rock3
@onready var rock_4: AnimatedSprite2D = $CanvasLayer/Rock4
@onready var rock_5: AnimatedSprite2D = $CanvasLayer/Rock5
@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var hover_sfx: AudioStreamPlayer2D = $HoverSFX
@onready var select_sfx: AudioStreamPlayer2D = $SelectSFX
@onready var back: Label = $CanvasLayer/Back

@onready var rock_lvls = [rock_1, rock_2, rock_3, rock_4, rock_5]
#@onready var lines = [line_2, line_3, line_4]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#for i in len(rock_lvls):
		#if Global.levels_unlocked.has(i+1):
			#rock_lvls[i].modulate = Color(1, 1, 1, 1)
			#if i > 0:
				#canvas_layer.get_node("Line"+str(i+1)).default_color = Color(1, 1, 1)
		#else:
			#rock_lvls[i].modulate = Color(0.262, 0.262, 0.262)
	pass
			
	
			
		
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("z"):
		Global.levels_unlocked = [1, 2, 3, 4, 5]
		
	for i in len(rock_lvls):
		if Global.levels_unlocked.has(i+1):
			rock_lvls[i].modulate = Color(1, 1, 1, 1)
			if i > 0:
				canvas_layer.get_node("Line"+str(i+1)).default_color = Color(1, 1, 1)
		else:
			rock_lvls[i].modulate = Color(0.262, 0.262, 0.262)

func _on_button_mouse_entered() -> void:
	rock_1.play("hover")
	hover_sfx.play()


func _on_button_mouse_exited() -> void:
	rock_1.play("default")


func _on_button_2_mouse_entered() -> void:
	rock_2.play("hover")
	hover_sfx.play()


func _on_button_2_mouse_exited() -> void:
	rock_2.play("default")


func _on_button_3_mouse_entered() -> void:
	rock_3.play("hover")
	hover_sfx.play()


func _on_button_3_mouse_exited() -> void:
	rock_3.play("default")


func _on_button_4_mouse_entered() -> void:
	rock_4.play("hover")
	hover_sfx.play()


func _on_button_4_mouse_exited() -> void:
	rock_4.play("default")


func _on_button_5_mouse_entered() -> void:
	rock_5.play("hover")
	hover_sfx.play()


func _on_button_5_mouse_exited() -> void:
	rock_5.play("default")


func _on_button_1_pressed() -> void:
	Global.play_pressed = true
	Global.level = 1
	Global.select_sfx = true
	queue_free()


func _on_button_2_pressed() -> void:
	if Global.levels_unlocked.has(2):
		Global.play_pressed = true
		Global.level = 2
		Global.select_sfx = true
		queue_free()


func _on_button_3_pressed() -> void:
	if Global.levels_unlocked.has(3):      
		Global.play_pressed = true
		Global.level = 3
		Global.select_sfx = true
		queue_free()


func _on_button_4_pressed() -> void:
	if Global.levels_unlocked.has(4):
		Global.play_pressed = true
		Global.level = 4
		Global.select_sfx = true
		queue_free()


func _on_button_5_pressed() -> void:
	if Global.levels_unlocked.has(5):
		Global.play_pressed = true
		Global.level = 5
		Global.select_sfx = true
		queue_free()


func _on_back_button_mouse_entered() -> void:
	back.modulate = Color(0.753, 0.796, 0.863, 1.0)
	hover_sfx.play()


func _on_back_button_mouse_exited() -> void:
	back.modulate = Color(0.258,0.328,0.456)
	hover_sfx.play()


func _on_back_button_pressed() -> void:
	Global.back_to_title = true
