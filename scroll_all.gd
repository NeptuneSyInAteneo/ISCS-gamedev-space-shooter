extends Node2D

@onready var clouds = $Parallax2D4
@onready var building3 = $Parallax2D3
@onready var building2 = $Parallax2D2
@onready var building1 = $Parallax2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#clouds.scroll_offset.x += -1
	#building3.scroll_offset.x += -3
	#building2.scroll_offset.x += -5
	#building1.scroll_offset.x += -7
	pass
