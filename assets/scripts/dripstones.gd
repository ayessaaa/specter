extends Node2D
@onready var dripstone_area: Area2D = $DripstoneArea
@onready var dripstone_1_1_body: RigidBody2D = $Dripstone1_1/DripstoneBody
@onready var dripstone_1_2_body: RigidBody2D = $Dripstone1_2/DripstoneBody
@onready var dripstone_1_3_body: RigidBody2D = $Dripstone1_3/DripstoneBody
@onready var dripstone_1_1: Area2D = $Dripstone1_1
@onready var dripstone_1_2: Area2D = $Dripstone1_2
@onready var dripstone_1_3: Area2D = $Dripstone1_3


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_dripstone_1_body_entered(body: Node2D) -> void:
	dripstone_1_1_body.gravity_scale = 1
	dripstone_1_1.get_node("StoneFallingSFX").play()

func _on_dripstone_1_2_body_entered(body: Node2D) -> void:
	dripstone_1_2_body.gravity_scale = 1
	dripstone_1_2.get_node("StoneFallingSFX").play()


func _on_dripstone_1_3_body_entered(body: Node2D) -> void:
	dripstone_1_3_body.gravity_scale = 1
	dripstone_1_3.get_node("StoneFallingSFX").play()
