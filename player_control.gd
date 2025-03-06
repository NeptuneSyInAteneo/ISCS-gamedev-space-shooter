extends CharacterBody2D

signal laser_shot(laser, location)

@export var SPEED = 300.0
@onready var marker = $Marker2D
@onready var timer = $Timer

var shoot_timer = 0

var laser = preload("res://player_fire.tscn")
func _ready() -> void:
	timer.set_one_shot(true)
	

func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction_x := Input.get_axis("ui_left", "ui_right")
	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var direction_y := Input.get_axis("ui_up", "ui_down")
	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
func _process(delta):
	if (shoot_timer <= 0) && (Input.is_action_pressed("ui_select")):
		shoot()
		shoot_timer = 0.1 # seconds
	elif (shoot_timer <= 0):
		shoot_timer = 0
	else:
		shoot_timer -= delta
		
			
	

	move_and_slide()

func shoot():
	print("shoot")
	laser_shot.emit(laser, marker.global_position) #emnits a signal
