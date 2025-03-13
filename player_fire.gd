extends Area2D

@export var speed = 600
@onready var animatedSprite = $AnimatedSprite2D

func _physics_process(delta):
	global_position.x += speed * delta 
	

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free() # Replace with function body.

func _on_body_entered(body: Node2D) -> void:
	animatedSprite.offset.x = -30
	animatedSprite.set_animation("explode")
	speed = 0
	
func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()
	pass # Replace with function body.
