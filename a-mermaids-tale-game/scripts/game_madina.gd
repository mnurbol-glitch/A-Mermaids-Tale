extends Node2D

@onready var player_spawn_pos = $PlayerSpawnPos
@onready var trident_container = $TridentContainer

var player = null

func _ready():
	player = get_tree().get_first_node_in_group("player")
	assert(player!=null)
	player.global_position = player_spawn_pos.global_position
	player.trident_shot.connect(_on_player_trident_shot)
	
func _process(_delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()

func _on_player_trident_shot(trident_scene, location):
	var trident = trident_scene.instatiate()
	trident.global_position = location
	trident_container.add_child(trident)
