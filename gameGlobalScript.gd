extends Node2D

@onready var player = $player
@onready var player_laser_container = $LaserHere
@onready var enemy_container = $EnemyHere
@onready var enemy_bullet_container = $EnemyBulletsHere

@onready var enemySpawn = $bounding/Marker2D
var rng = RandomNumberGenerator.new()

var enemy1 = preload("res://enemy.tscn")
var missile = preload("res://enemy_bullet.tscn")

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
	
	
func _on_timer_timeout() -> void:
	#print("new enemy")
	var enemy_new = enemy1.instantiate()
	enemy_new.global_position = Vector2(enemySpawn.global_position.x, rng.randfn(0,200))
	enemy_new.missile_launch.connect(on_enemy_missile_launch)
	enemy_container.add_child(enemy_new)
	pass # Replace with function body.
	
func on_enemy_missile_launch(muzzle_loc):
	var proj = missile.instantiate()
	proj.player_reference = player
	proj.global_position = muzzle_loc
	enemy_bullet_container.add_child(proj)
	
