extends Area2D

@onready var player_reference
@onready var coll = $bullet_pill
@onready var anim = $AnimatedSprite2D
var direction

signal player_hit()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# rotate towards the direction of the player
	assert(player_reference != null)
	look_at(player_reference.global_position)
	rotate(deg_to_rad(180))
	direction = (player_reference.position - position).normalized()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction*4
	pass

func _on_area_entered(area: Area2D) -> void:
	coll.queue_free()
	anim.set_animation("boom")
	player_hit.emit()
	pass # Replace with function body.

func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()
	pass # Replace with function body.
