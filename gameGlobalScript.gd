extends Node2D

@onready var player = $player
@onready var player_laser_container = $LaserHere

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	assert(player!=null)
	player.laser_shot.connect(on_player_laser_shot)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_player_laser_shot(laser_scene, location):
	var laser = laser_scene.instantiate()
	laser.global_position = location
	player_laser_container.add_child(laser)
