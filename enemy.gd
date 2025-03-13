extends Area2D

@onready var moveT = $moveTime
@onready var coll = $CollisionShape2D
@onready var anim = $AnimatedSprite2D

@export var health = 3
var speed = 5
var is_moving = true
var timeNeeded
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timeNeeded = rng.randf_range(0.75,1.5)
	moveT.start(timeNeeded)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.x -= speed*int(is_moving)
	pass


func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()
	pass # Replace with function body.


func _on_move_time_timeout() -> void:
	# stop a bit
	is_moving = !is_moving
	pass # Replace with function body.


func _on_area_entered(area: Area2D) -> void:
	print("hit")
	health-=1
	
	if health <=0:
		speed=0
		coll.set_disabled(true)
		anim.set_animation("death")
	pass # Replace with function body.
	



func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()
	pass # Replace with function body.
