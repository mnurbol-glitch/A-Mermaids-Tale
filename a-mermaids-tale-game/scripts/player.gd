extends CharacterBody2D

signal trident_shot(trident_scene, location)

@export var speed = 600

@onready var muzzle = $Muzzle

var trident_scene = preload("res://scenes/trident.tscn")

func _process(_delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()

func _physics_process(_delta):
	var direction = Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down"))
	velocity = direction  * speed
	move_and_slide()
	
func shoot():
	trident_shot.emit(trident_scene, muzzle.global_position)
