extends Node2D
@onready var option_animation: AnimationPlayer = $OptionAnimation
@onready var play: Label = $CanvasLayer/Options/Play
@onready var levels: Label = $CanvasLayer/Options/Levels
@onready var settings: Label = $CanvasLayer/Options/Settings
@onready var credits: Label = $CanvasLayer/Options/Credits
@onready var play_skull_1: Sprite2D = $CanvasLayer/MiniSkulls/PlaySkull1
@onready var play_skull_2: Sprite2D = $CanvasLayer/MiniSkulls/PlaySkull2
@onready var levels_skull_1: Sprite2D = $CanvasLayer/MiniSkulls/LevelsSkull1
@onready var levels_skull_2: Sprite2D = $CanvasLayer/MiniSkulls/LevelsSkull2
@onready var settings_skull_1: Sprite2D = $CanvasLayer/MiniSkulls/SettingsSkull1
@onready var settings_skull_2: Sprite2D = $CanvasLayer/MiniSkulls/SettingsSkull2
@onready var credits_skull_1: Sprite2D = $CanvasLayer/MiniSkulls/CreditsSkull1
@onready var credits_skull_2: Sprite2D = $CanvasLayer/MiniSkulls/CreditsSkull2
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var options = [play, levels, settings, credits]
@onready var mini_skulls = [play_skull_1, play_skull_2, levels_skull_1, levels_skull_2, settings_skull_1, settings_skull_2, credits_skull_1, credits_skull_2]

@onready var click_sfx: AudioStreamPlayer2D = $HoverSFX
@onready var select_sfx: AudioStreamPlayer2D = $SelectSFX

var fade_in_done = false
var current_hover = "play"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_button_mouse_entered() -> void:
	if current_hover != "play" and fade_in_done:
		hover(play)
		current_hover = "play"
		click_sfx.play()


func _on_levels_button_mouse_entered() -> void:
	if current_hover != "levels" and fade_in_done:
		hover(levels)
		current_hover = "levels"
		click_sfx.play()


func _on_settings_button_mouse_entered() -> void:
	if current_hover != "settings" and fade_in_done:
		hover(settings)
		current_hover = "settings"
		click_sfx.play()


func _on_credits_button_mouse_entered() -> void:
	if current_hover != "credits" and fade_in_done:
		hover(credits)
		current_hover = "credits"
		click_sfx.play()
		
		
func hover(option):
	for i in options:
		if i == option:
			option.add_theme_color_override("font_color", Color(1.0, 1.0, 1.0))
		else:
			i.add_theme_color_override("font_color", Color(0.545, 0.608, 0.706, 1.0))
			
	var index = options.find(option)
	
	
	for i in len(mini_skulls):
		if i == index*2 or i == index*2+1:
			mini_skulls[i].visible = true
		else:
			mini_skulls[i].visible = false


func _on_play_button_pressed() -> void:
	if fade_in_done:
		select_sfx.play()
		Global.play_pressed = true
		animation_player.play("fade_out")
		
		#queue_free()

func _on_levels_button_pressed() -> void:
	if fade_in_done:
		select_sfx.play()

func _on_settings_button_pressed() -> void:
	if fade_in_done:
		select_sfx.play()

func _on_credits_button_pressed() -> void:
	if fade_in_done:
		select_sfx.play()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade_in":
		fade_in_done = true
	elif anim_name == "fade_out":
		queue_free()
